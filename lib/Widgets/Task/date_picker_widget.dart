import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  
  DateTime _startDate = DateTime.now();

  Future<void> _pickedDate = async 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            //
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  size: 24,
                  color: AppColors.bgblue,
                ),
                SizedBox(width: 8),
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
          ),
        ),
      ],
    );
  }
}
