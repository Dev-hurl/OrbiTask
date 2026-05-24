import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbitask/Pages/Main/create_task1.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
                'assets/icons/task list.svg',
                width: 100,
                height: 100,
                colorFilter: ColorFilter.mode(
                  AppColors.bgblue, 
                  BlendMode.srcIn),
              ),
          SizedBox(height: 16),
          Text(
            'Create a task to efficiently\nmanage your time.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppFonts.body,
              fontWeight: AppFonts.regular,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateTask1()),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.bgblue,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(
              'Create a Task',
              style: TextStyle(
                color: AppColors.bgwhite,
                fontSize: AppFonts.body,
                fontWeight: AppFonts.semibold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}