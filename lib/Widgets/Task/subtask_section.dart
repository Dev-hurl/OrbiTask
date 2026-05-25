import 'package:flutter/material.dart';
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
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
          title: Text(
            'Add Subtask',
            style: TextStyle(
              fontSize: AppFonts.subheading,
              fontWeight: AppFonts.semibold,
              color: AppColors.textPrimary,
            ),
          ),
          content: TextField(
            controller: _subtaskController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter Subtask Name',
              hintStyle: TextStyle(
                color: AppColors.shark300,
                fontSize: AppFonts.body,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.shark300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.bgblue),
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
                style: TextStyle(color: AppColors.shark400),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.bgblue,
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
              child: Text('Add', style: TextStyle(color: AppColors.bgwhite)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add subtask button
        GestureDetector(
          onTap: _showAddSubtaskDialog,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Icon(Icons.add, color: AppColors.bgblue, size: 24),
                SizedBox(width: 8),
                Text(
                  'Add Sub Task',
                  style: TextStyle(
                    fontSize: AppFonts.body,
                    fontWeight: AppFonts.medium,
                    color: AppColors.bgblue,
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
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outlined, size: 20, color: AppColors.bgblue),
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
