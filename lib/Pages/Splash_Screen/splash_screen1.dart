import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:orbitask/constants/app_colors.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgwhite,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/OrbiTask blue.png',
                width: 200,
                height: 200,
              ),

              SizedBox(height: 4),

              Text(
                '...Tasks in motion, Goals in Sight',
                style: TextStyle(
                  color: AppColors.textPrimary,
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
