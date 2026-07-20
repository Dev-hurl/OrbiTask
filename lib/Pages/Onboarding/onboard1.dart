import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Onboarding1 extends StatelessWidget {
  final VoidCallback onNext;

  const Onboarding1({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/images/onboard1.png',
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
      
          SizedBox(height: 24),
          Text(
            'Welcome to OrbiTask',
            style: TextStyle(
              fontSize: AppFonts.subheading,
              fontWeight: AppFonts.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8),
      
          Text(
            'Your ultimate sidekick for crushing tasks, hitting deadlines, and celebrating wins.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppFonts.body,
              fontWeight: AppFonts.regular,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 32),
      
          //Filled Button
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 48),
                backgroundColor: AppColors.bgblue,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: onNext,
              child: Text(
                'Let\'s Get Started',
                style: TextStyle(
                  fontSize: AppFonts.body,
                  fontWeight: AppFonts.semibold,
                  color: AppColors.bgwhite,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
      
          //Button with border
        ],
      ),
    );
  }
}
