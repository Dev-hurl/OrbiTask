import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // prevents anyone from creating an instance

  // ─── LIGHT MODE ───────────────────────────────────────────

  // Backgrounds
  static const Color bgwhite = Color(0xFFFFFFFF);
  static const Color bgblue = Color(0xFF727FDC);
  static const Color bgblue100 = Color(0xFFDFEDFA);
  static const Color shark50 = Color(0xFFF6F6F6);
  static const Color shark100 = Color(0xFFE7E7E7);
  static const Color shark400 = Color(0xFF888888);
  static const Color shark300 = Color(0xFFB0B0B0);
  static const Color shark600 = Color(0xFF5D5D5D);
  static const Color bgblue50 = Color(0xFFF1F7FD);
  static const Color grey = Color(0xFFE7E7E7);

  // Buttons
  static const Color buttonPrimary = Color(0xFF3D3D3D);
  static const Color buttonText = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimary = Color(0xFF454545);
  static const Color textSecondary = Color(0xFF5D5D5D);

  // Accents
  static const Color accent = Color(0xFF6C63FF);
  static const Color error = Color(0xFFE53935);
  static const Color success = Color(0xFF48BB78);


  // ─── DARK MODE ────────────────────────────────────────────

  // Backgrounds
  static const Color darkBgPrimary = Color(0xFF121212);    // replaces bgwhite
  static const Color darkBgSecondary = Color(0xFF1E1E1E);  // replaces shark50
  static const Color darkBgCard = Color(0xFF252525);       // replaces shark100 / grey
  static const Color darkBgBlue = Color(0xFF727FDC);       // stays same — brand color
  static const Color darkBgBlue100 = Color(0xFF1A2340);    // replaces bgblue100
  static const Color darkBgBlue50 = Color(0xFF151C2E);     // replaces bgblue50
  static const Color darkShark400 = Color(0xFF9E9E9E);     // replaces shark400
  static const Color darkShark300 = Color(0xFF757575);     // replaces shark300
  static const Color darkShark600 = Color(0xFFBDBDBD);     // replaces shark600

  // Buttons
  static const Color darkButtonPrimary = Color(0xFF727FDC); // brand color on dark
  static const Color darkButtonText = Color(0xFFFFFFFF);    // stays same

  // Text
  static const Color darkTextPrimary = Color(0xFFF5F5F5);   // replaces textPrimary
  static const Color darkTextSecondary = Color(0xFFB0B0B0); // replaces textSecondary

  // Accents — same across both modes
  static const Color darkAccent = Color(0xFF857DFF);   // slightly lighter for dark bg
  static const Color darkError = Color(0xFFEF5350);
  static const Color darkSuccess = Color(0xFF68D391);
}
