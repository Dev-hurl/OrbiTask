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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        GestureDetector(
          onTap: _pickTime,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(Icons.timer_rounded, size: 24, color: colorScheme.secondary),
                SizedBox(width: 8),
                Text(
                  'Start Time',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFonts.semibold,
                  ),
                ),
                Spacer(),
                Text(
                  _startTime.format(context),
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
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
