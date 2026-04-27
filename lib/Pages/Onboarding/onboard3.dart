import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Onboarding/onboard4.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/onboard3.png',
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 24),
            Text(
              'Focus, Track, Achieve',
              style: TextStyle(
                fontSize: AppFonts.subheading,
                fontWeight: AppFonts.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8),

            Text(
              'Use the built-in timer to stay in the zone, hit milestones, and earn rewards for your hard work.',
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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboarding4()),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: AppFonts.body,
                    fontWeight: AppFonts.semibold,
                    color: AppColors.bgwhite,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}