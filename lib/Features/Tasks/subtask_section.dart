import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class SubtaskSection extends StatefulWidget {
  final Function(List<String>) onSubtasksChanged;

  const SubtaskSection({super.key, required this.onSubtasksChanged});

  @override
  State<SubtaskSection> createState() => _SubtaskSectionState();
}

class _SubtaskSectionState extends State<SubtaskSection> {
  final List<String> _subTasks = [];
  final TextEditingController _subtaskController = TextEditingController();

  @override
  dispose() {
    _subtaskController.dispose();
    super.dispose();
  }

  void _showAddSubtaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final textTheme = Theme.of(context).textTheme;
        final colorScheme = Theme.of(context).colorScheme;

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
          title: Text(
            'Add Subtask',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: AppFonts.semibold,
            ),
          ),
          content: TextField(
            controller: _subtaskController,
            autofocus: true,
            style: textTheme.bodyMedium?.copyWith(fontWeight: AppFonts.medium),
            decoration: InputDecoration(
              hintText: 'Enter Subtask Name',
              hintStyle: TextStyle(
                fontSize: AppFonts.caption,
                fontWeight: AppFonts.medium,
                color: colorScheme.onSurface,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: colorScheme.onPrimary,
                  //width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colorScheme.secondary,
                  width: 1.2,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _subtaskController.clear();
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: AppFonts.semibold,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (_subtaskController.text.isNotEmpty) {
                  setState(() {
                    _subTasks.add(_subtaskController.text);
                    _subtaskController.clear();
                  });
                  widget.onSubtasksChanged(_subTasks);
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Add',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: AppFonts.semibold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add subtask button
        GestureDetector(
          onTap: _showAddSubtaskDialog,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedStopWatch,
                  color: colorScheme.secondary,
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  'Add Sub Task',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFonts.semibold,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Subtask list
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _subTasks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.check_box_outlined,
                    size: 24,
                    color: colorScheme.secondary,
                  ),
                  SizedBox(width: 8),
                  Text(
                    _subTasks[index],
                    style: TextStyle(
                      fontSize: AppFonts.body,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
