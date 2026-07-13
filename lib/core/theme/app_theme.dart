import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bgwhite,
    primaryColor: AppColors.accent,
    colorScheme: const ColorScheme.light(
      primary: AppColors.accent,
      secondary: AppColors.bgblue,
      surface: AppColors.bgwhite,
      surfaceContainerHighest: AppColors.shark50,
      error: AppColors.error,
      onPrimary: AppColors.buttonText,
      onSecondary: AppColors.buttonText,
      onSurface: AppColors.textPrimary,
      onError: AppColors.bgwhite,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: AppFonts.primary,
        fontSize: AppFonts.heading1,
        fontWeight: AppFonts.bold,
        color: AppColors.textPrimary,
      ),
      displayMedium: TextStyle(
        fontFamily: AppFonts.primary,
        fontSize: AppFonts.heading2,
        fontWeight: AppFonts.semibold,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontFamily: AppFonts.primary,
        fontSize: AppFonts.body,
        fontWeight: AppFonts.regular,
        color: AppColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppFonts.primary,
        fontSize: AppFonts.body,
        fontWeight: AppFonts.regular,
        color: AppColors.textSecondary,
      ),
      bodySmall: TextStyle(
        fontFamily: AppFonts.primary,
        fontSize: AppFonts.caption,
        fontWeight: AppFonts.regular,
        color: AppColors.textSecondary,
      ),
    ),
    dividerColor: AppColors.shark100,
    cardColor: AppColors.shark50,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBgPrimary,
    primaryColor: AppColors.darkAccent,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkAccent,
      secondary: AppColors.darkBgBlue,
      surface: AppColors.darkBgPrimary,
      surfaceContainerHighest: AppColors.darkBgSecondary,
      error: AppColors.darkError,
      onPrimary: AppColors.darkButtonText,
      onSecondary: AppColors.darkButtonText,
      onSurface: AppColors.darkTextPrimary,
      onError: AppColors.darkBgPrimary,
    ),
    textTheme: const TextTheme(
  displayLarge: TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: AppFonts.heading1,
    fontWeight: AppFonts.bold,
    color: AppColors.darkTextPrimary,
  ),
  displayMedium: TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: AppFonts.heading2,
    fontWeight: AppFonts.semibold,
    color: AppColors.darkTextPrimary,
  ),
  bodyLarge: TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: AppFonts.body,
    fontWeight: AppFonts.regular,
    color: AppColors.darkTextPrimary,
  ),
  bodyMedium: TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: AppFonts.body,
    fontWeight: AppFonts.regular,
    color: AppColors.darkTextSecondary,
  ),
  bodySmall: TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: AppFonts.caption,
    fontWeight: AppFonts.regular,
    color: AppColors.darkTextSecondary,
  ),
),
    dividerColor: AppColors.darkBgCard,
    cardColor: AppColors.darkBgSecondary,
  );
}
