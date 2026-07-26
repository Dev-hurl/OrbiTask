import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbitask/Features/Tasks/tasks_view.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String time;
  final String date;
  final String priority;
  final VoidCallback onDelete;

  const TaskCard({
    super.key,
    required this.title,
    required this.time,
    required this.date,
    required this.priority,
    required this.onDelete,
  });

  Color get _priorityColor {
    switch (priority.toLowerCase()) {
      case 'low':
        return AppColors.error;
      case 'high':
        return AppColors.success;
      case 'medium':
        return AppColors.bgblue;
      default:
        return AppColors.textPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: AppFonts.subheading,
                  fontWeight: AppFonts.semibold,
                ),
              ),
              //PopUpMenuButton
              PopupMenuButton<String>(
                color: colorScheme.surfaceContainerHighest,
                icon: Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).canvasColor,
                ),
                onSelected: (value) {
                  if (value == 'edit') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasksView()),
                    );
                  } else if (value == 'delete') {
                    onDelete();
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
                          color: colorScheme.secondary,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Edit',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.secondary,
                            fontWeight: AppFonts.semibold,
                          ),
                        ),
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
                          color: colorScheme.error,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Delete',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.error,
                            fontWeight: AppFonts.semibold,
                          ),
                        ),
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
                  colorScheme.secondary,
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
                  colorScheme.secondary,
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
            spacing: 4,
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
