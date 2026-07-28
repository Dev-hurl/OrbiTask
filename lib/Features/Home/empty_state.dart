import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:orbitask/Features/Tasks/screens/create_task1.dart';
import 'package:orbitask/constants/app_fonts.dart';

class EmptyState extends StatelessWidget {
  final String firstName;

  const EmptyState({super.key, this.firstName = 'User'});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedTask01,
            size: 100,
            color: colorScheme.secondary,
          ),
          SizedBox(height: 16),
          Text(
            'Create a task to efficiently manage your time.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateTask1(firstName: firstName),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.secondary,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(
              'Create a Task',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: AppFonts.semibold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
