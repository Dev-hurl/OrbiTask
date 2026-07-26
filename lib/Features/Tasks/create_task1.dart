import 'package:flutter/material.dart';
import 'package:orbitask/Features/Tasks/create_task2.dart';
import 'package:orbitask/Widgets/Custom%20Widgets/custom_text_form_field.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class CreateTask1 extends StatefulWidget {
  const CreateTask1({super.key});

  @override
  State<CreateTask1> createState() => _CreateTask1State();
}

class _CreateTask1State extends State<CreateTask1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose(); // always clean up controllers
    _descriptionController.dispose();
    super.dispose();
  }

  String? _selectedPriority;

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(leading: BackButton(color: colorScheme.secondary)),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 48),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Create New Task',
                  style: textTheme.displayMedium?.copyWith(
                    fontWeight: AppFonts.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Enter your new task details.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
                SizedBox(height: 12),
                //Progress
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      minHeight: 5,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1 of 2',
                      style: TextStyle(
                        fontSize: AppFonts.caption,
                        fontWeight: AppFonts.semibold,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Title',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: AppFonts.semibold,
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      hinText: 'Write Task Name',
                      controller: _titleController,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: AppFonts.semibold,
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      maxline: 5,
                      hinText: 'Add Task Details',
                      controller: _descriptionController,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                //Priority Level
                DropdownButtonFormField<String>(
                  initialValue: _selectedPriority,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFonts.medium,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Choose Priority Level',
                    labelText: 'Priority Level',
                    labelStyle: textTheme.bodyLarge?.copyWith(
                      fontSize: AppFonts.subheading,
                      fontWeight: AppFonts.semibold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).dividerColor,
                        //width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.error),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: colorScheme.secondary,
                        width: 1.2,
                      ),
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest,
                  ),
                  items: ['High', 'Medium', 'Low']
                      .map(
                        (option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPriority = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) return 'Select a priority level';
                    return null;
                  },
                ),
                SizedBox(height: 24),
                //Category
                DropdownButtonFormField<String>(
                  initialValue: _selectedCategory,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFonts.medium,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Choose a Category',
                    labelText: 'Category',
                    labelStyle: textTheme.bodyLarge?.copyWith(
                      fontSize: AppFonts.subheading,
                      fontWeight: AppFonts.semibold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).dividerColor,
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.error),
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest,
                  ),
                  items: ['Work', 'Personal', 'School', 'Other']
                      .map(
                        (option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) return 'Select a category';
                    return null;
                  },
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgblue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // only navigates if all fields pass validation
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateTask2(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Set Timeframe',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: AppFonts.semibold,
                        ),
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
