import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Account%20Creation/forgot_password.dart';
import 'package:orbitask/Pages/Account%20Creation/sign_up.dart';
import 'package:orbitask/Pages/Main/home_page.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: AppFonts.heading2,
                      fontWeight: AppFonts.semibold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Login to access your account, manage your time and task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: AppFonts.regular,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 24),
                  //FirstName
                  TextField(
                    style: TextStyle(
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.medium,
                    ),
                    decoration: InputDecoration(
                      labelText: 'First Name',
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
                  //PassWord
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
                  SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: AppFonts.caption,
                          fontWeight: AppFonts.bold,
                          color: AppColors.textSecondary,
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
                          MaterialPageRoute(builder: (context) => HomePage()),
                        ),
                        child: Text(
                          'Login',
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
                    'Or continue with',
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
                      MaterialPageRoute(builder: (context) => SignUp()),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: AppFonts.caption,
                          fontWeight: AppFonts.regular,
                          color: AppColors.textSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: ' Sign Up',
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