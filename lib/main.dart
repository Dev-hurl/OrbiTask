import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orbitask/Features/provider/theme_notifier.dart';
import 'package:orbitask/Pages/Account%20Creation/sign_up.dart';
import 'package:orbitask/Pages/Onboarding/main_onboard.dart';
import 'package:orbitask/core/theme/app_theme.dart';
import 'package:orbitask/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(hasSeenOnboarding: hasSeenOnboarding),
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
      home: hasSeenOnboarding ? SignUp() : MainOnboard(),
      themeMode: themeNotifier.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
