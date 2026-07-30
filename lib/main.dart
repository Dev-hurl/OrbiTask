import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orbitask/Features/Auth/screens/sign_in.dart';
import 'package:orbitask/Features/Home/home_page.dart';
import 'package:orbitask/Features/provider/theme_notifier.dart';
import 'package:orbitask/Features/Splash_Screen/splash_screen1.dart';
import 'package:orbitask/core/Services/notification_service.dart';
import 'package:orbitask/core/theme/app_theme.dart';
import 'package:orbitask/core/util/navigation_key.dart';
import 'package:orbitask/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Initialize Analytics & Firestore instances (optional but good for warm-up)
  FirebaseAnalytics.instance;
  FirebaseFirestore.instance;

  // Handle Google redirect result on web
  if (kIsWeb) {
    try {
      await FirebaseAuth.instance.getRedirectResult();
    } catch (e) {
      debugPrint('Redirect result error: $e');
    }
  }

  await NotificationService.instance.initialize();

  final prefs = await SharedPreferences.getInstance();
  final hasAskedPermission = prefs.getBool('hasAskedPermission') ?? false;

  if (!hasAskedPermission) {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    await prefs.setBool('hasAskedPermission', true);
    await prefs.setBool(
      'notificationsEnabled',
   
      settings.authorizationStatus == AuthorizationStatus.authorized,
    );
  }

  final hasSeenOnboarding = kIsWeb
      ? false
      : (prefs.getBool('hasSeenOnboarding') ?? false);


  // Note: currentUser is available immediately after initializeApp if persistence is enabled (default)
  final isLoggedIn = FirebaseAuth.instance.currentUser != null;

  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ],
        child: MyApp(
          hasSeenOnboarding: hasSeenOnboarding,
          isLoggedIn: isLoggedIn,
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  final bool isLoggedIn;

  const MyApp({
    super.key,
    required this.hasSeenOnboarding,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    Widget homeScreen;
    if (!hasSeenOnboarding) {
      homeScreen = SplashScreen1();
    } else if (isLoggedIn) {
      homeScreen = HomePage();
    } else {
      homeScreen = Signin();
    }

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'OrbiTask',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: homeScreen,
      themeMode: themeNotifier.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}   