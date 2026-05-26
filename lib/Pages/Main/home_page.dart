import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Main/create_task1.dart';
import 'package:orbitask/Widgets/Home/tasks_list.dart';
import 'package:orbitask/Widgets/custom_nav_bar.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/Home/empty_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
  ]; // empty = no tasks yet


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Emmanuel',
              style: TextStyle(
                fontSize: AppFonts.subheading,
                fontWeight: AppFonts.semibold,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'welcome back',
              style: TextStyle(
                fontSize: AppFonts.body,
                fontWeight: AppFonts.medium,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/calendar-03-stroke-rounded.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(AppColors.bgblue, BlendMode.srcIn),
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
              colorFilter: ColorFilter.mode(AppColors.bgblue, BlendMode.srcIn),
            ),
            color: AppColors.bgblue,
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      body: tasks.isEmpty ? EmptyState() : TaskList(tasks: tasks, onDelete: (index) {
        setState(() {
          tasks.removeAt(index);
        });
      },),
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
          backgroundColor: AppColors.bgblue50,
          child: Icon(Icons.add, color: AppColors.bgblue),
        ),
      ),
    );
  }
}
