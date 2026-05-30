import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomTextFormField({
    super.key,
    required this.hinText,
    this.icon,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPhysics: NeverScrollableScrollPhysics(),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(
          fontSize: AppFonts.body,
          color: AppColors.shark300,
        ),
        suffixIcon: Icon(icon),
        suffixIconColor: AppColors.bgblue,
        prefixIcon: Icon(icon),
        prefixIconColor: AppColors.bgblue,
        filled: true,
        fillColor: Color(0xffEAEAEA),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.shark300,
            //width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.bgblue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.error,
          )
        )
      ),
    );
  }
}
