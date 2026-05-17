import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Main/create_task2.dart';
import 'package:orbitask/Pages/Onboarding/onboard1.dart';

void main() {
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
      home: const CreateTask2(),
    );
  }
}
