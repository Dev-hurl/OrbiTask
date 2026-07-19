import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Account%20Creation/sign_in.dart';
import 'package:orbitask/Pages/Account%20Creation/verification.dart';
import 'package:orbitask/Pages/Main/home_page.dart';
import 'package:orbitask/Pages/Services/auth_services.dart';
import 'package:orbitask/Widgets/custom_text_form_field.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                      'Join the OrbiTask Crew',
                      style: TextStyle(
                        fontSize: AppFonts.heading2,
                        fontWeight: AppFonts.semibold,
                        color: AppColors.textSecondary,
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
                    SizedBox(height: 20),
                    Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fullname',
                          style: TextStyle(
                            fontSize: AppFonts.body,
                            fontWeight: AppFonts.semibold,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        CustomTextFormField(
                          hinText: 'e.g. John Doe',
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
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
                          'Email',
                          style: TextStyle(
                            fontSize: AppFonts.body,
                            fontWeight: AppFonts.semibold,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          hinText: 'e.g. JohnDoe@example.com',
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
                          hinText: 'Create a strong password',
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
                              final user = await _authService.signUpWithEmail(
                                _emailController.text,
                                _passwordController.text,
                                _nameController.text,
                              );
                              if (user != null) {
                                if (!mounted) return;
                                navigator.push(
                                  MaterialPageRoute(
                                    builder: (context) => Verification(),
                                  ),
                                );
                              }
                            } on FirebaseAuthException catch (e) {
                              if (!mounted) return;
                              scaffoldMessenger.showSnackBar(
                                SnackBar(
                                  content: Text(e.message ?? 'Signup failed'),
                                ),
                              );
                            }
                          },
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
                        MaterialPageRoute(builder: (context) => Signin()),
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
      ),
    );
  }
}
