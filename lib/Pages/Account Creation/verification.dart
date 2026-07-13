import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Main/home_page.dart';
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
                          //mainAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                    children: [myBox(1), myBox(2), myBox(3), myBox(4)],
                  ),
                ),
                // Timer
                Text('Resend code in 00:30'),
                // Button
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          firstName:
                              FirebaseAuth.instance.currentUser?.displayName
                                  ?.split(' ')
                                  .first ??
                              'User',
                        ),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.bgblue,
                    minimumSize: Size(double.infinity, 48),
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: AppColors.bgwhite,
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.semibold,
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

  Widget myBox(int index) {
    return Container(
      height: 48,
      padding: EdgeInsets.all(8),
      color: AppColors.shark100,
      alignment: Alignment.center,
      child: Text(
        '$index',
        style: TextStyle(
          fontWeight: AppFonts.semibold,
          fontSize: AppFonts.heading2,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
