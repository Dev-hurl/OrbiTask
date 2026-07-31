import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:orbitask/Features/Auth/screens/sign_in.dart';
import 'package:orbitask/Widgets/Custom%20Widgets/custom_text_form_field.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(leading: BackButton(color: colorScheme.secondary)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text('Change Password', style: textTheme.displayMedium),
                Text(
                  'Enter your details',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
                SizedBox(height: 24),
                Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter New Password',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: AppFonts.semibold,
                      ),
                    ),
                    CustomTextFormField(
                      hinText: 'Enter new Password',
                      controller: _passwordController,
                      obscureText: true,
                      icon: UnconstrainedBox(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedEye,
                          size: 24,
                        ),
                      ),
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
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: AppFonts.semibold,
                      ),
                    ),
                    CustomTextFormField(
                      hinText: 'Confirm Password',
                      controller: _confirmPasswordController,
                      obscureText: true,
                      icon: UnconstrainedBox(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedEye,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
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
                      onPressed: () {
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
    );
  }
}
