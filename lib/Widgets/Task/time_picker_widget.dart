import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class TimerPickerWidget extends StatefulWidget {
  final Function(TimeOfDay) onTimeSelected;

  const TimerPickerWidget({super.key, required this.onTimeSelected});

  @override
  State<TimerPickerWidget> createState() => _TimerPickerWidgetState();
}

class _TimerPickerWidgetState extends State<TimerPickerWidget> {
  TimeOfDay _startTime = TimeOfDay.now();

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (picked != null) {
      setState(() {
        _startTime = picked;
      });
      widget.onTimeSelected(_startTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickTime,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.timer_rounded,
                  size: 24,
                  color: AppColors.bgblue,
                ),
                SizedBox(width: 8),
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
                  _startTime.format(context),
                  style: TextStyle(
                    fontSize: AppFonts.body,
                    fontWeight: AppFonts.semibold,
                    color: AppColors.shark600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}