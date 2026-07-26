import 'package:flutter/material.dart';
import 'package:orbitask/Features/Auth/screens/sign_up.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding4 extends StatelessWidget {
  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
  }

  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/onboard4.png',
              width: double.infinity,
              height: 505,
              fit: BoxFit.cover,
            ),
        
            SizedBox(height: 80),
            Text(
              'Notes & Reminders',
              style: textTheme.displayMedium?.copyWith(fontWeight: AppFonts.bold),
            ),
            SizedBox(height: 16),
        
            Text(
              'Jot down ideas, set reminders, and keep everything in one place to stay organized.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
            SizedBox(height: 40),
        
            //Filled Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  await _completeOnboarding();
                  navigator.push(
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text(
                  'Create Account',
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
