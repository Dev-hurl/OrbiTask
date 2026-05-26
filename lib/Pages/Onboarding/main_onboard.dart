import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Onboarding/onboard1.dart';
import 'package:orbitask/Pages/Onboarding/onboard2.dart';
import 'package:orbitask/Pages/Onboarding/onboard3.dart';
import 'package:orbitask/Pages/Onboarding/onboard4.dart';
import 'package:orbitask/constants/app_colors.dart';

class MainOnboard extends StatefulWidget {
  const MainOnboard({super.key});

  @override
  State<MainOnboard> createState() => _MainOnboardState();
}

class _MainOnboardState extends State<MainOnboard> {
  late PageController _pageController;
  int _currentPage = 0;
  final int _totalPages = 4;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgwhite,
      body: SafeArea(
        child: Column(
          children: [
            // page content
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Onboarding1(onNext: _nextPage),
                  Onboarding2(onNext: _nextPage),
                  Onboarding3(onNext: _nextPage),
                  Onboarding4(),
                ],
              ),
            ),

            // dot indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_totalPages, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.bgblue
                        : AppColors.bgblue.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}