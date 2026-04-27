import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Main/create_task2.dart';
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
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: AppColors.bgblue)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                  children: [
                    Text(
                      'Create New Task',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: AppFonts.heading2,
                        fontWeight: AppFonts.semibold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Enter your new task details.',
                      style: TextStyle(
                        color: AppColors.shark400,
                        fontSize: AppFonts.body,
                        fontWeight: AppFonts.regular,
                      ),
                    ),
                    SizedBox(height: 12),
                    //Progress 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: AppColors.shark100,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.bgblue),
                          borderRadius: BorderRadius.circular(10),
                          minHeight: 5,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '1 of 2',
                          style: TextStyle(
                            fontSize: AppFonts.caption,
                            fontWeight: AppFonts.semibold,
                            color: AppColors.bgblue,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Task Title',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: AppFonts.body,
                            fontWeight: AppFonts.semibold,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: 'Write a Task Name',
                            hintStyle: TextStyle(
                              color: AppColors.shark300,
                              fontSize: AppFonts.body,
                              fontWeight: AppFonts.medium,
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
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: AppFonts.body,
                            fontWeight: AppFonts.semibold,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _descriptionController,
                          maxLines: 2,
                          expands: true,
                          decoration: InputDecoration(
                            hintText: 'Add Task Details',
                            hintStyle: TextStyle(
                              color: AppColors.shark300,
                              fontSize: AppFonts.body,
                              fontWeight: AppFonts.medium,
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
                      ],
                    ),
                    SizedBox(height: 24),
                    //Priority Level
                    DropdownButtonFormField<String>(
                      initialValue: _selectedPriority,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: InputDecoration(
                        labelText: 'Priority Level',
                        labelStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: AppFonts.body,
                          fontWeight: AppFonts.semibold,
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
                      decoration: InputDecoration(
                        labelText: 'Category',
                        labelStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: AppFonts.body,
                          fontWeight: AppFonts.semibold,
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
                    SizedBox(height: 32),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
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
                            /*print('button pressed');
                              print(
                                'form valid: ${_formKey.currentState!.validate()}',
                              );*/
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
                            'Next',
                            style: TextStyle(
                              fontSize: AppFonts.body,
                              fontWeight: AppFonts.semibold,
                              color: AppColors.bgwhite,
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
      ),
    );
  }
}
