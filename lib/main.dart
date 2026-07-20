import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orbitask/Features/provider/theme_notifier.dart';
import 'package:orbitask/Pages/Account%20Creation/sign_up.dart';
import 'package:orbitask/Pages/Splash_Screen/splash_screen1.dart';
import 'package:orbitask/core/theme/app_theme.dart';
import 'package:orbitask/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Handle Google redirect result on web
  if (kIsWeb) {
    try {
      await FirebaseAuth.instance.getRedirectResult();
    } catch (e) {
      debugPrint('Redirect result error: $e');
    }
  }

  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = kIsWeb
      ? false
      : (prefs.getBool('hasSeenOnboarding') ?? false);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: MyApp(hasSeenOnboarding: hasSeenOnboarding),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  const MyApp({super.key, required this.hasSeenOnboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return MaterialApp(
      title: 'OrbiTask',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: hasSeenOnboarding ? SignUp() : SplashScreen1(),
      themeMode: themeNotifier.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
