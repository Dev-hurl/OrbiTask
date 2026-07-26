import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Onboarding2 extends StatelessWidget {
  final VoidCallback onNext;

  Onboarding2({super.key, required this.onNext});
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Image.asset(
            'assets/images/onboard2.png',
            width: double.infinity,
            height: 505,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 80),
          Text(
            'Plan Smarter, Not Harder',
            style: textTheme.displayMedium?.copyWith(fontWeight: AppFonts.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Create tasks, set priorities, and stay on top of your to-dos like a pro. Your goals, your way.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
          //Page View
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
              onPressed: onNext,
              child: Text(
                'Next',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: AppFonts.semibold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
