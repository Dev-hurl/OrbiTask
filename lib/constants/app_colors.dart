import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // prevents anyone from creating an instance

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

  //Gradient         // dividers, outlines

  // Buttons
  static const Color buttonPrimary = Color(0xFF3D3D3D); // primary button bg
  static const Color buttonText = Color(0xFFFFFFFF); // text on button

  // Text
  static const Color textPrimary = Color(0xFF454545); // headings, body
  static const Color textSecondary = Color(0xFF5D5D5D); // captions, hints   // text on dark bg

  // Accents
  static const Color accent = Color(0xFF6C63FF); // brand / CTA color
  static const Color error = Color(0xFFE53935);
  static const Color success = Color(0xFF48BB78); // success, confirmations
}
