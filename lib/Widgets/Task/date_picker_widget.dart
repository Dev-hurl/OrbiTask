import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({super.key, required this.onDateSelected});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  
  DateTime _startDate = DateTime.now();

  Future<void> _pickedDate() async {
    final DateTime today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: today, 
      firstDate: today,
      lastDate: DateTime(2100),
    ); 

    if (picked != null ) {
      setState(() {
        _startDate = picked;
      });
      widget.onDateSelected(_startDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickedDate,
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
                  '${_startDate.day.toString().padLeft(2, '0')}/'
                  '${_startDate.month.toString().padLeft(2, '0')}/'
                  '${_startDate.year.toString().padLeft(2, '0')}',
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
