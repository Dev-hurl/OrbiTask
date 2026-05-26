import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Account%20Creation/login.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/Pages/Onboarding/onboard1.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  // change to false to test returning user
  final bool isNewUser = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => isNewUser ? const Onboarding1() : const Login(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgblue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Orbitask white.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 4),
              Text(
                '...Tasks in motion, Goals in Sight',
                style: TextStyle(
                  color: AppColors.bgwhite,
                  fontSize: AppFonts.body,
                  fontWeight: AppFonts.regular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}