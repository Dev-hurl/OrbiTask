import 'package:flutter/material.dart';
import 'package:orbitask/Features/Notification/notifications.dart';
import 'package:orbitask/Features/Tasks/screens/create_task1.dart';
import 'package:orbitask/Features/Home/tasks_list.dart';
import 'package:orbitask/Widgets/Custom%20Widgets/custom_nav_bar.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'empty_state.dart';

class HomePage extends StatefulWidget {
  final String firstName;
  const HomePage({super.key, this.firstName = 'User'});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),

      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ),
        title: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, ${widget.firstName}', style: textTheme.displayMedium),
            Text('welcome back', style: textTheme.bodyMedium),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/calendar-03-stroke-rounded.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              // Handle calendar icon press
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/notifications.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
            color: AppColors.bgblue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
          ),
        ],
      ),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateTask1()),
            );
            // Handle FAB press
          },
          backgroundColor: colorScheme.surfaceContainerHighest,
          child: Icon(Icons.add, color: AppColors.bgblue),
        ),
      ),
    );
  }
}
