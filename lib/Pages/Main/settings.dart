import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Main/account.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: AppColors.bgblue),
        title: Text('Settings',style: TextStyle(
          fontSize: AppFonts.subheading,
          fontWeight:AppFonts.semibold,
        ),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment .start,
            children: [
              Text(
                'General',
                style: TextStyle(
                  fontSize: AppFonts.body,
                  fontWeight: AppFonts.medium,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Account
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Account()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person_2, color: AppColors.bgblue),
                        SizedBox(height: 12),
                        Text(
                          'Account',
                          style: TextStyle(
                            fontSize: AppFonts.subheading,
                            fontWeight: AppFonts.semibold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: AppColors.bgblue,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  // Change Password
                  Row(
                    children: [
                      Icon(Icons.lock_reset_rounded, color: AppColors.bgblue),
                      SizedBox(height: 8),
                      Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: AppFonts.subheading,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.bgblue,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  // Notification
                  Row(
                    children: [
                      Icon(Icons.notifications_active_rounded, color: AppColors.bgblue),
                      SizedBox(height: 8),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: AppFonts.subheading,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.bgblue,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'About',
                style: TextStyle(
                  fontSize: AppFonts.body,
                  fontWeight: AppFonts.medium,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Support
                  Row(
                    children: [
                      Icon(Icons.headphones_rounded, color: AppColors.bgblue),
                      SizedBox(height: 8),
                      Text(
                        'Support',
                        style: TextStyle(
                          fontSize: AppFonts.subheading,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.bgblue,
                      ),
                    ],
                  ),
                  SizedBox(height: 24,),
                  // T's & C
                  Row(
                    children: [
                      Icon(Icons.safety_check_rounded, color: AppColors.bgblue),
                      SizedBox(height: 8),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: AppFonts.subheading,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.bgblue,
                      ),
                    ],
                  ),
                  SizedBox(height: 24,),
                  // Log out
                  Row(
                    children: [
                      Icon(Icons.logout_rounded, color: AppColors.bgblue),
                      SizedBox(height: 8),
                      Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: AppFonts.subheading,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.error,
                      ),
                    ],
                  ),SizedBox(height: 24,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
