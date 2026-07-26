import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Onboarding1 extends StatelessWidget {
  final VoidCallback onNext;

  const Onboarding1({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/onboard1.png',
                width: double.infinity,
                height: 505,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 80),
              Text(
                'Welcome to OrbiTask',
                style: textTheme.displayMedium?.copyWith(
                  fontWeight: AppFonts.bold,
                )
              ),
              SizedBox(height: 16),
              Text(
                'Your ultimate sidekick for crushing tasks, hitting deadlines, and celebrating wins.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.secondary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: onNext,
                  child: Text(
                    'Let\'s Get Started',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: AppFonts.semibold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
