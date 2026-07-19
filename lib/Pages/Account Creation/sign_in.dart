import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Account%20Creation/forgot_password.dart';
import 'package:orbitask/Pages/Account%20Creation/sign_up.dart';
import 'package:orbitask/Pages/Main/home_page.dart';
import 'package:orbitask/Pages/Services/auth_services.dart';
import 'package:orbitask/Widgets/custom_text_form_field.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                key: _formKey,
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
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      'Signin to access your account, manage your time and task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: AppFonts.regular,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 24),
                    //FirstName
                    Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: AppFonts.body,
                            fontWeight: AppFonts.semibold,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          hinText: 'Enter your email address',
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: AppFonts.body,
                            fontWeight: AppFonts.semibold,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        CustomTextFormField(
                          hinText: 'Enter your password',
                          controller: _passwordController,
                          icon: Icons.visibility_off_rounded,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ],
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
                            fontWeight: AppFonts.medium,
                            color: AppColors.error,
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
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;

                            final navigator = Navigator.of(context);
                            final scaffoldMessenger = ScaffoldMessenger.of(
                              context,
                            );

                            try {
                              final user = await _authService.signInWithEmail(
                                _emailController.text,
                                _passwordController.text,
                              );
                              if (user != null) {
                                if (!mounted) return;
                                navigator.pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(
                                      firstName:
                                          user.displayName?.split(' ').first ??
                                          'User',
                                    ),
                                  ),
                                );
                              }
                            } on FirebaseAuthException catch (e) {
                              if (!mounted) return;
                              scaffoldMessenger.showSnackBar(
                                SnackBar(
                                  content: Text(e.message ?? 'Signin failed'),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Signin',
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
                        if (!kIsWeb)
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.bgblue100,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () async {
                                  final navigator = Navigator.of(context);
                                  final User? user = await _authService
                                      .signInWithGoogle();
                                  if (user != null) {
                                    if (!mounted) return;
                                    navigator.pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(
                                          firstName:
                                              user.displayName
                                                  ?.split(' ')
                                                  .first ??
                                              'User',
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Image.asset(
                                  'assets/images/google.png',
                                  width: 24,
                                  height: 24,
                                ),
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
                            child: GestureDetector(
                              onTap: () async {
                                // Handle Facebook Sign-In logic here
                              },
                              child: Image.asset(
                                'assets/images/facebook.png',
                                width: 24,
                                height: 24,
                              ),
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
      ),
    );
  }
}
