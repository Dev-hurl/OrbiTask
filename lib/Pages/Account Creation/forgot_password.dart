import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Account%20Creation/sign_in.dart';
import 'package:orbitask/Widgets/custom_text_form_field.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //bool isPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose(); // always clean up controllers
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: AppColors.bgblue)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: AppFonts.heading2,
                      fontWeight: AppFonts.semibold,
                    ),
                  ),
                  Text(
                    'Enter your email address to receive to a password reset link..',
                    style: TextStyle(
                      color: AppColors.shark400,
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.regular,
                    ),
                  ),
                  SizedBox(height: 24),
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter New Password',
                        style: TextStyle(
                          fontWeight: AppFonts.semibold,
                          fontSize: AppFonts.body,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      CustomTextFormField(
                        hinText: 'Enter new Password',
                        controller: _passwordController,
                        obscureText: true,
                        icon: Icons.visibility,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm New Password',
                        style: TextStyle(
                          fontSize: AppFonts.body,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      CustomTextFormField(
                        hinText: 'Confirm Password',
                        controller: _confirmPasswordController,
                        obscureText: true,
                        icon: Icons.visibility,
                      ),
                    ],
                  ),
                  SizedBox(height: 32),

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
                        onPressed: () {
                          /*print('button pressed');
                          print(
                            'form valid: ${_formKey.currentState!.validate()}',
                          );*/
                          if (_formKey.currentState!.validate()) {
                            // only navigates if all fields pass validation
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signin()),
                            );
                          }
                        },
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                            fontSize: AppFonts.body,
                            fontWeight: AppFonts.semibold,
                            color: AppColors.bgwhite,
                          ),
                        ),
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
