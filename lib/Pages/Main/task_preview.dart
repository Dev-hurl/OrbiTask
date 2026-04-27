import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color:AppColors.bgblue,
        ),
        title: Text(
              'Preview',
              style: TextStyle(
                fontSize: AppFonts.subheading,
                fontWeight: AppFonts.semibold,
                color: AppColors.textSecondary,
              ),
            ),
      ),
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    'Task Name',
                    style: TextStyle(
                      fontSize: AppFonts.subheading,
                      fontWeight: AppFonts.semibold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(
                    width: 132,
                    height: 36,
                    
                    child: Text(
                      'UI/UX Assignment',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
