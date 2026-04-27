import 'package:flutter/material.dart';
import 'package:orbitask/Widgets/custom_nav_bar.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
      body: Center(
        child: Text('Timer View'),
      ),
    );
  }
}