import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Onboarding3 extends StatelessWidget {
  final VoidCallback onNext;

  const Onboarding3({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Image.asset(
            'assets/images/onboard3.png',
            width: double.infinity,
            height: 505,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 80),
          Text(
            'Focus, Track, Achieve',
            textAlign: TextAlign.center,
            style: textTheme.displayMedium?.copyWith(fontWeight: AppFonts.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Use the built-in timer to stay in the zone, hit milestones, and earn rewards for your hard work.',
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
