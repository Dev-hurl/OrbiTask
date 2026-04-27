import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbitask/Pages/Main/task_preview.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class CreateTask2 extends StatelessWidget {
  const CreateTask2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: AppColors.bgblue)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
                children: [
                  Text(
                    'Create New Task',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: AppFonts.heading2,
                      fontWeight: AppFonts.semibold,
                    ),
                  ),
                  Text(
                    'Enter time frame for start and end of the task',
                    style: TextStyle(
                      color: AppColors.shark400,
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.regular,
                    ),
                  ),
                  SizedBox(height: 24),
                  // Add form fields here
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        backgroundColor: AppColors.shark100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.bgblue,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        minHeight: 5,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '2 of 2',
                        style: TextStyle(
                          fontSize: AppFonts.caption,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.bgblue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Column(
                    children: [
                      //First Row: Time
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/timer_outline.svg',
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              AppColors.bgblue,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Start Time',
                            style: TextStyle(
                              fontSize: AppFonts.body,
                              fontWeight: AppFonts.medium,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '09:00 AM',
                            style: TextStyle(
                              fontSize: AppFonts.body,
                              fontWeight: AppFonts.medium,
                              color: AppColors.shark600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Divider(height: 1, thickness: 1, color: AppColors.shark100),
                      SizedBox(height: 24),
                      //Second Row: Date
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/calendar-01-stroke-rounded.svg',
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              AppColors.bgblue,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Start Date',
                            style: TextStyle(
                              fontSize: AppFonts.body,
                              fontWeight: AppFonts.medium,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '12/02/2025',
                            style: TextStyle(
                              fontSize: AppFonts.body,
                              fontWeight: AppFonts.medium,
                              color: AppColors.shark600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Divider(height: 1, thickness: 1, color: AppColors.shark100),
                      //Third Row:Reminder
                      SizedBox(height: 24),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/notifications.svg',
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              AppColors.bgblue,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Reminder',
                            style: TextStyle(
                              fontSize: AppFonts.body,
                              fontWeight: AppFonts.medium,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Spacer(),
                          Text(
                                '5 Minutes before',
                                style: TextStyle(
                                  fontSize: AppFonts.caption,
                                  fontWeight: AppFonts.medium,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              //Dropdown Reminder
                        ],
                      ),
                      SizedBox(height: 24),
                      Divider(
                        height: sqrt1_2,
                        thickness: 1,
                        color: AppColors.shark100,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  //Subtask
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/add.svg',
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          AppColors.bgblue,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Add SubTask',
                        style: TextStyle(
                          fontSize: AppFonts.body,
                          fontWeight: AppFonts.medium,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Attach File',
                          style: TextStyle(
                            fontSize: AppFonts.caption,
                            fontWeight: AppFonts.semibold,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: AppColors.bgblue, 
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/document.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            AppColors.bgblue,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Browse Files',
                          style: TextStyle(
                            fontSize: AppFonts.body,
                            fontWeight: AppFonts.medium,
                            color: AppColors.bgblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                      ],
                    ),
                  SizedBox(height: 24),
              
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgblue,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => TaskPreview()),
                        );
                      },
                      child: Text(
                        'Preview & Save',
                        style: TextStyle(
                          fontSize: AppFonts.body,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.bgwhite,
                        ),
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
}
