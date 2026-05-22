import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final bool obscureText;
  final int maxLines;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomTextFormField({
    super.key,
    required this.hinText,
    required this.icon,
    required this.controller,
    this.maxLines = 2,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPhysics: NeverScrollableScrollPhysics(),
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(
          fontSize: AppFonts.body,
          color: AppColors.shark300,
        ),
        prefixIcon: Icon(icon),
        prefixIconColor: Color(0xff464AE5),
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
            //width: 1,
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
