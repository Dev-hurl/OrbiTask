import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Account%20Creation/login.dart';
import 'package:orbitask/Pages/Account%20Creation/verification.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Image.asset(
                    'assets/images/Orbitask logo.png',
                    width: 59,
                    height: 60,
                  ),
                  SizedBox(height: 16),

                  Text(
                    'Join the OrbiTask Crew',
                    style: TextStyle(
                      fontSize: AppFonts.heading2,
                      fontWeight: AppFonts.semibold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Create your free account to sync tasks, earn rewards and never miss a deadline.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: AppFonts.regular,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 24),

                  TextField(
                    style: TextStyle(
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.medium,
                    ),
                    decoration: InputDecoration(
                      labelText: 'FullName',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.bgblue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    style: TextStyle(
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.medium,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.bgblue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    style: TextStyle(
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.medium,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.bgblue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.bgblue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Verification(),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: AppFonts.body,
                            fontWeight: AppFonts.bold,
                            color: AppColors.bgwhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Or Sign up with',
                    style: TextStyle(
                      fontSize: AppFonts.caption,
                      fontWeight: AppFonts.regular,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Google
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.bgblue100,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/google.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      SizedBox(width: 24),
                      //Facebook
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.bgblue100,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/facebook.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                          fontSize: AppFonts.caption,
                          fontWeight: AppFonts.regular,
                          color: AppColors.textSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: ' Login',
                            style: TextStyle(
                              fontSize: AppFonts.caption,
                              fontWeight: AppFonts.bold,
                              color: AppColors.bgblue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TapGestureRecognizer {}
