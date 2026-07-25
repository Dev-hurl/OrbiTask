import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hinText,
    this.icon,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      scrollPhysics: NeverScrollableScrollPhysics(),
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(
          fontSize: AppFonts.caption,
          fontWeight: AppFonts.medium,
          color: AppColors.shark400,
        ),
        suffixIcon: Icon(icon),
        suffixIconColor: colorScheme.secondary,
        //prefixIcon: Icon(icon),
        //prefixIconColor: AppColors.bgblue,
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.onPrimary,
            //width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.bgblue,
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
      ),
    );
  }
}
