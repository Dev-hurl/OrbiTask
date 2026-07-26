import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orbitask/Features/Auth/screens/sign_in.dart';
import 'package:orbitask/Features/provider/theme_notifier.dart';
import 'package:orbitask/Features/Splash_Screen/splash_screen1.dart';
import 'package:orbitask/Widgets/toast/toast_manager.dart';
import 'package:orbitask/Widgets/toast/toast_overlay.dart';
import 'package:orbitask/core/Services/notification_service.dart';
import 'package:orbitask/core/theme/app_theme.dart';
import 'package:orbitask/core/util/navigation_key.dart';
import 'package:orbitask/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAnalytics.instance; // ← initializes analytics

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
  final hasSeenOnboarding = kIsWeb
      ? false
      : (prefs.getBool('hasSeenOnboarding') ?? false);
  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ToastManager()),
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ],
        child: MyApp(hasSeenOnboarding: hasSeenOnboarding),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  const MyApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'OrbiTask',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        child = DevicePreview.appBuilder(context, child);
        return ToastOverlay(child: child);
      },
      home: hasSeenOnboarding ? Signin() : SplashScreen1(),
      themeMode: themeNotifier.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
