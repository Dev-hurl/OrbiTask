import 'package:flutter/material.dart';
import 'package:orbitask/Widgets/Task/task_card.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class TaskList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;
  final Function(int) onDelete;

  const TaskList({super.key, required this.tasks, required this.onDelete});

  List<Map<String, dynamic>> _filterByCategory(String category) {
    if (category == 'All') return tasks;
    return tasks.where((t) => t['category'] == category).toList();
  }

  Widget _buildTaskCards(List<Map<String, dynamic>> filteredTasks) {
    if (filteredTasks.isEmpty) {
      return Center(
        child: Text(
          'No tasks in this category.',
          style: TextStyle(
            fontSize: AppFonts.body,
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        return TaskCard(
          title: filteredTasks[index]['title'],
          time: filteredTasks[index]['time'],
          date: filteredTasks[index]['date'],
          priority: filteredTasks[index]['priority'],
          onDelete: () => onDelete(index),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      //animationDuration: Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 30,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            isScrollable: true,
            labelColor: AppColors.bgblue,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.bgblue,
            indicator: BoxDecoration(
              shape: BoxShape.circle,
            ),
            labelStyle: TextStyle(
              fontWeight: AppFonts.semibold,
              fontSize: AppFonts.body,
            ),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Personal'),
              Tab(text: 'Work'),
              Tab(text: 'School'),
              Tab(text: 'Others'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildTaskCards(_filterByCategory('All')),
                _buildTaskCards(_filterByCategory('Personal')),
                _buildTaskCards(_filterByCategory('Work')),
                _buildTaskCards(_filterByCategory('School')),
                _buildTaskCards(_filterByCategory('Others')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}