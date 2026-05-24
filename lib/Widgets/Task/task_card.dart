import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String time;
  final String date;
  final String priority;

  const TaskCard({
    super.key,
    required this.title,
    required this.time,
    required this.date,
    required this.priority,
  });

  Color get _priorityColor {
    switch (priority.toLowerCase()) {
      case 'low':
        return AppColors.error;
      case 'high':
        return AppColors.success;
      case 'medium':
        return AppColors.shark600;
      default:
        return AppColors.textPrimary;
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
            color: AppColors.shark600,
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
              PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: AppColors.shark400),
                onSelected: (value) {
                  if (value == 'edit') {
                    // handle edit
                  } else if (value == 'delete') {
                    // handle delete
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 18,
                          color: AppColors.textPrimary,
                        ),
                        SizedBox(width: 8),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_forever_rounded,
                          size: 18,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text('Delete', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'cancel',
                    child: Row(
                      children: [
                        Icon(
                          Icons.close,
                          size: 18,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(width: 8),
                        Text('Cancel'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
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
                  fontWeight: AppFonts.semibold,
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
                  fontWeight: AppFonts.semibold,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          //Priority Level
          Row(
            children: [
              Text(
                'Priority Level',
                style: TextStyle(
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.semibold,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
