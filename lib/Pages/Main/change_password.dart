import 'package:flutter/material.dart';
import 'package:orbitask/Widgets/custom_text_form_field.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Change Password',
          style: TextStyle(
            fontSize: AppFonts.subheading,
            fontWeight: AppFonts.semibold,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter Old Password'),
                Text('Enter the a new password to reset'),
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
                      controller: passwordController,
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
                        'Enter New Password',
                        style: TextStyle(
                          fontWeight: AppFonts.semibold,
                          fontSize: AppFonts.body,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      CustomTextFormField(
                        hinText: 'Enter new Password',
                        controller: _confirmPasswordController,
                        obscureText: true,
                        icon: Icons.visibility,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
