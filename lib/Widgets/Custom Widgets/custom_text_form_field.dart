import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinText;
  final IconData? icon;
  final int maxline;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hinText,
    this.icon,
    this.maxline = 1,
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
      maxLines: maxline,
      style: TextStyle(
        fontWeight: AppFonts.medium,
        color: colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: textTheme.bodySmall?.copyWith(
          fontWeight: AppFonts.medium,
          color: colorScheme.onSurface,
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
            color: Theme.of(context).dividerColor,
            //width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.secondary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      ),
    );
  }
}
