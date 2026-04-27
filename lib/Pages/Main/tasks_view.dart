import 'package:flutter/material.dart';
import 'package:orbitask/Widgets/custom_nav_bar.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
      body: Center(child: Text('Tasks View')),
    );
  }
}
