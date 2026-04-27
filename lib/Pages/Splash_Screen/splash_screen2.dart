import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:orbitask/constants/app_colors.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

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
                'assets/images/OrbiTask white.png',
                width: 200,
                height: 200,
              ),

              SizedBox(height: 4),

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
