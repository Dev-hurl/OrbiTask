import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Onboarding/onboard3.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Onboarding2 extends StatelessWidget {
   Onboarding2({super.key});
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/onboard2.png',
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 24),
            Text(
              'Plan Smarter, Not Harder',
              style: TextStyle(
                fontSize: AppFonts.subheading,
                fontWeight: AppFonts.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8),

            Text(
              'Create tasks, set priorities, and stay on top of your to-dos like a pro. Your goals, your way.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppFonts.body,
                fontWeight: AppFonts.regular,
                color: AppColors.textSecondary,
              ),
            ),
            //Page View
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
                  MaterialPageRoute(builder: (context) => Onboarding3()),
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