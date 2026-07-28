import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbitask/Features/Tasks/screens/edit_tasks.dart';
import 'package:orbitask/Features/Tasks/screens/tasks_overview.dart';
import 'package:orbitask/Widgets/Custom%20Widgets/custom_dialog.dart';
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

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TasksOverview()),
        );
      },
      child: Container(
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
                        MaterialPageRoute(builder: (context) => EditTasks()),
                      );
                    } else if (value == 'delete') {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (_) => CustomDialog(
                          title: 'Delete Task',
                          message: 'This task will be permanently deleted.',
                          confirmText: 'Delete',
                          onConfirm: () {
                            onDelete();
                          },
                        ),
                      );
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
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                //Time
                Text(
                  time,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFonts.semibold,
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
                Text(
                  date,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFonts.semibold,
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
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: AppFonts.medium,
                  ),
                ),
                Text(
                  priority,
                  style: textTheme.bodySmall?.copyWith(
                    color: _priorityColor,
                    fontWeight: AppFonts.semibold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
