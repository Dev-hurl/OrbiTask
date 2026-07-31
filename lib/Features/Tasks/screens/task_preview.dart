import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:orbitask/Features/Home/home_page.dart';
import 'package:orbitask/Features/Tasks/models/task_model.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:orbitask/core/Services/firestore_service.dart';

class TaskPreview extends StatelessWidget {
  final TaskModel task;
  final String firstName;

  const TaskPreview({super.key, required this.task, this.firstName = 'User'});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final formattedTime = task.startTime.format(context);
    final formattedDate = DateFormat('dd/MM/yyyy').format(task.startDate);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: colorScheme.secondary),
        title: Text('Task Preview', style: textTheme.titleMedium),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preview',
              style: textTheme.displayMedium?.copyWith(
                fontWeight: AppFonts.bold,
              ),
            ),
            Text(
              'Enter the task name and a description.',
              style: textTheme.bodyMedium,
            ),

            SizedBox(height: 24),

            // title + description box
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.secondary),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: AppFonts.bold,
                      color: colorScheme.secondary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    task.description,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // priority + category chips
            Row(
              children: [
                _buildChip(context, task.priority, colorScheme.secondary),
                const SizedBox(width: 8),
                _buildChip(context, task.category, colorScheme.secondary),
              ],
            ),

            const SizedBox(height: 24),

            // start time
            _buildInfoRow(
              context,
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedStopWatch,
                size: 24,
                color: colorScheme.secondary,
              ),
              label: 'Start Time',
              value: formattedTime,
            ),
            _buildDivider(colorScheme),

            // start date
            _buildInfoRow(
              context,
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedCalendar03,
                size: 24,
                color: colorScheme.secondary,
              ),
              label: 'Start Date',
              value: formattedDate,
            ),
            _buildDivider(colorScheme),

            // reminder
            _buildInfoRow(
              context,
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedAlarmClock,
                size: 24,
                color: colorScheme.secondary,
              ),
              label: 'Reminder',
              value: task.reminder,
            ),
            _buildDivider(colorScheme),

            const SizedBox(height: 24),

            // subtasks
            Text(
              'Subtasks',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: AppFonts.semibold,
              ),
            ),
            const SizedBox(height: 12),
            ...task.subTasks.map(
              (subtask) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedCheckmarkSquare02,
                      color: colorScheme.secondary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(subtask, style: textTheme.bodyMedium),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // attachment
            if (task.attachmentPath != null) ...[
              Text(
                'Attach File',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: AppFonts.semibold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/document.svg',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      colorScheme.secondary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(task.attachmentPath!, style: textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: 24),
            ],

            // save button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () async {
                  try {
                    await FirestoreService().createTask(
                      title: task.title,
                      description: task.description,
                      priority: task.priority,
                      category: task.category,
                      startTime: task.startTime,
                      startDate: task.startDate,
                      reminder: task.reminder,
                      subTasks: task.subTasks,
                    );

                    if (!context.mounted) return;

                    // navigate back to home and clear stack
                    final resolvedFirstName =
                        (firstName.trim().isEmpty || firstName == 'User')
                        ? (FirebaseAuth.instance.currentUser?.displayName
                                  ?.trim()
                                  .split(' ')
                                  .first ??
                              'User')
                        : firstName;

                    final createdTask = {
                      'title': task.title,
                      'time': task.startTime.format(context),
                      'date': DateFormat('dd/MM/yyyy').format(task.startDate),
                      'priority': task.priority,
                      'category': task.category,
                    };

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomePage(
                          firstName: resolvedFirstName,
                          initialTasks: [createdTask],
                        ),
                      ),
                      (route) => false,
                    );
                  } catch (e) {
                    debugPrint('❌ Error saving task: $e');
                  }
                },
                child: Text(
                  'Save',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: AppFonts.semibold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required dynamic icon,
    required String label,
    required String value,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          icon,
          SizedBox(width: 8),
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: AppFonts.semibold,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(ColorScheme colorScheme) {
    return Divider(
      height: 1,
      thickness: 1,
      color: colorScheme.surfaceContainerHighest,
    );
  }
}
