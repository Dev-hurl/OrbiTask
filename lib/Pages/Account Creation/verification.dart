import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: AppColors.bgblue)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Verification',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppFonts.heading2,
                    fontWeight: AppFonts.semibold,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text:
                        'Enter the 4-digit code sent to your email johndoe@gmail.com',
                    style: TextStyle(
                      color: AppColors.shark400,
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.medium,
                    ),
                  ),
                ),
                SizedBox(height: 32),

                Container(height: 120, width: 120, color: AppColors.bgblue100),
                SizedBox(height: 32),
                // Code Box
                SizedBox(
                  height: 80,

                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    //shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 2,
                        ),
                    children: [myBox(1), myBox(2), myBox(3), myBox(4)],
                  ),
                ),
                // Timer
                // Button
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myBox(int index) {
    return Container(
      //margin: EdgeInsets.all(8),
      color: AppColors.shark100,
      alignment: Alignment.center,
      child: Text(
        '$index',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: AppFonts.semibold,
          fontSize: AppFonts.heading2,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
