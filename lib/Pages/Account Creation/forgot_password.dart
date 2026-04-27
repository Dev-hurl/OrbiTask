import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbitask/Pages/Account%20Creation/login.dart';
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

  bool _isPasswordVisible = false;

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
                    'Change Password',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: AppFonts.heading2,
                      fontWeight: AppFonts.semibold,
                    ),
                  ),
                  Text(
                    'Enter your new password to proceed.',
                    style: TextStyle(
                      color: AppColors.shark400,
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.regular,
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Enter a New Password',
                      hintText: 'New Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: SvgPicture.asset(
                          _isPasswordVisible
                              ? 'assets/icons/eye.svg'
                              : 'assets/icons/eye-slash.svg',
                          colorFilter: ColorFilter.mode(
                            AppColors.bgblue,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.shark300,
                        fontSize: AppFonts.body,
                        fontWeight: AppFonts.regular,
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.shark600,
                        fontSize: AppFonts.body,
                        fontWeight: AppFonts.medium,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: AppColors.bgblue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm New Password',
                      /*suffixIcon: SvgPicture.asset(
                        'assets/icons/eye-slash.svg',
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          AppColors.bgblue,
                          BlendMode.srcIn,
                        ),
                      ),*/
                      hintStyle: TextStyle(
                        color: AppColors.shark300,
                        fontSize: AppFonts.body,
                        fontWeight: AppFonts.regular,
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.shark600,
                        fontSize: AppFonts.body,
                        fontWeight: AppFonts.medium,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: AppColors.bgblue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
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
                              MaterialPageRoute(builder: (context) => Login()),
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
