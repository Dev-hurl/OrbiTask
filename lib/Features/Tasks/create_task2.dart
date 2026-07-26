import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbitask/Features/Tasks/date_picker_widget.dart';
import 'package:orbitask/Features/Tasks/subtask_section.dart';
import 'package:orbitask/Features/Tasks/time_picker_widget.dart';
import 'package:orbitask/Features/Tasks/task_preview.dart';
import 'package:orbitask/Widgets/toast/toast_manager.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:provider/provider.dart';

class CreateTask2 extends StatefulWidget {
  const CreateTask2({super.key});

  @override
  State<CreateTask2> createState() => _CreateTask2State();
}

class _CreateTask2State extends State<CreateTask2> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  List<String> _subTasks = [];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(leading: BackButton(color: colorScheme.secondary)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Create New Task',
                  style: textTheme.displayMedium?.copyWith(
                    fontWeight: AppFonts.bold,
                  ),
                ),
                Text(
                  'Enter time frame for start and end of task',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
                SizedBox(height: 24),
                // Add form fields here
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LinearProgressIndicator(
                      value: 1,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorScheme.secondary,
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
                        color: colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Column(
                  children: [
                    //First Row: Time
                    TimerPickerWidget(
                      onTimeSelected: (time) {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: colorScheme.surfaceContainerHighest,
                    ),
                    SizedBox(height: 24),
                    //Second Row: Date
                    DatePickerWidget(
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: colorScheme.surfaceContainerHighest,
                    ),
                    //Third Row:Reminder
                    SizedBox(height: 24),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notifications.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            colorScheme.secondary,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Reminder',
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: AppFonts.semibold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '5 Minutes before',
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        //Dropdown Reminder
                      ],
                    ),
                    SizedBox(height: 24),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: colorScheme.surfaceContainerHighest,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                //Subtask
                SubtaskSection(
                  onSubtasksChanged: (subtasks) {
                    setState(() {
                      _subTasks = subtasks;
                    });
                  },
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Attach File',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: AppFonts.semibold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: colorScheme.secondary,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/document.svg',
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              colorScheme.secondary,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Browse Files',
                            style: TextStyle(
                              fontSize: AppFonts.body,
                              fontWeight: AppFonts.medium,
                              color: colorScheme.secondary,
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
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.secondary,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      if (_subTasks.isEmpty) {
                        context.read<ToastManager>().show(
                          text: 'Add at least one subtask',
                          icon: Icon(
                            Icons.rocket_launch,
                            color: colorScheme.onPrimary,
                            size: 20,
                          ),
                        );
                        return;
                      }
                      // proceed to preview
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskPreview()),
                      );
                    },
                    child: Text(
                      'Preview & Save',
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
        ),
      ),
    );
  }
}
