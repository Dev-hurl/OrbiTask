import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orbitask/Pages/Account%20Creation/forgot_password.dart';
import 'package:orbitask/Pages/Main/create_task1.dart';
import 'package:orbitask/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OrbiTask',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const CreateTask1(),
    );
  }
}
