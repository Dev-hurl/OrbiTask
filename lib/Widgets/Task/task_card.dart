import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String time;
  final String date;
  final String priority;
  final String progress;

  const TaskCard({
    super.key,
    required this.title,
    required this.time,
    required this.date,
    required this.priority,
    required this.progress,
  });

  Color get _priorityColor {
    switch (priority.toLowerCase()) {
      case 'low':
        return AppColors.error;
      case 'high':
        return AppColors.success;
      case 'medium':
        return AppColors.shark600;
      default: return AppColors.textPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.shark100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.shark400),
        /*boxShadow: [
          BoxShadow(
            color: AppColors.shark600.,
          )
        ]*/
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title & 3 dots Menu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: AppFonts.subheading,
                  fontWeight: AppFonts.semibold,
                  color: AppColors.textPrimary,
                ),
              ),
              //PopUpMenuButton
              Icon(Icons.more_horiz, color: AppColors.shark400),
            ],
          ),
          //Time & Date
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/timer_outline.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  AppColors.bgblue,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 4),
              //Time
              Text(
                time,
                style: TextStyle(
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.medium,
                  color: AppColors.textSecondary,
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                'assets/icons/calendar-01-stroke-rounded.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  AppColors.bgblue,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.medium,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          //Priority Level
          Row(
            children: [
              Text(
                'Priority Level',
                style: TextStyle(
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.medium,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                priority,
                style: TextStyle(
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.semibold,
                  color: _priorityColor,
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          //
        ],
      ),
    );
  }
}
