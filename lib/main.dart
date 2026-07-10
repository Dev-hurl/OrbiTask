import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orbitask/Pages/Account%20Creation/sign_up.dart';
import 'package:orbitask/Pages/Main/create_task1.dart';
import 'package:orbitask/Pages/Splash_Screen/splash_screen1.dart';
import 'package:orbitask/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  const MyApp({super.key, required this.hasSeenOnboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OrbiTask',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: hasSeenOnboarding? SignUp() : SplashScreen1(),
    );
  }
}
