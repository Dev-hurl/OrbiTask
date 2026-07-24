import 'package:flutter/material.dart';
import 'package:orbitask/Features/Home/empty_state.dart';
import 'package:orbitask/Features/Home/tasks_list.dart';
import 'package:orbitask/Widgets/Custom%20Widgets/custom_nav_bar.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  List<Map<String, dynamic>> tasks = [
    {
      'title': 'UIUX Assignment',
      'time': '09:00 AM',
      'date': '12/02/2025',
      'priority': 'Low',
      'category': 'Work',
    },
    {
      'title': 'Build My App',
      'time': '01:20 AM',
      'date': '12/04/2026',
      'priority': 'High',
      'category': 'School',
    },
    {
      'title': 'Build My App',
      'time': '01:20 AM',
      'date': '12/04/2026',
      'priority': 'High',
      'category': 'School',
    },
    {
      'title': 'Build My App',
      'time': '01:20 AM',
      'date': '12/04/2026',
      'priority': 'High',
      'category': 'School',
    },
    {
      'title': 'Build My App',
      'time': '01:20 AM',
      'date': '12/04/2026',
      'priority': 'Medium',
      'category': 'Personal',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
      body: tasks.isEmpty
          ? EmptyState()
          : TaskList(
              tasks: tasks,
              onDelete: (index) {
                setState(() {
                  tasks.removeAt(index);
                });
              },
            ),
    );
  }
}
