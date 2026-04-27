import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.bgblue,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Verification',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: AppFonts.heading2,
                    fontWeight: AppFonts.semibold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Enter the 4-digit code sent to your email',
                    style: TextStyle(
                      color: AppColors.shark400,
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.medium,
                    ),
                    children: [
                      TextSpan(
                        text: 'Johndoe@gmail.com',
                        style: TextStyle(
                          fontSize: AppFonts.body,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.shark400,
                        ),
                      ),
                    ],
                  ),
                ),

                //Code Box
                //Timer
                //Button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
