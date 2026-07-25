import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbitask/Features/Home/home_page.dart';
import 'package:orbitask/Features/Settings/settings.dart';
import 'package:orbitask/Features/Timer/timer.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
import '../../Features/Tasks/tasks_view.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, this.currentIndex = 0});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 80,
      decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            0,
            'assets/icons/home outline.svg',
            'assets/icons/home bold.svg',
            'Home',
            HomePage(),
          ),
          _buildNavItem(
            1,
            'assets/icons/task list.svg',
            'assets/icons/task list filled.svg',
            'Task',
            TasksView(),
          ),
          _buildNavItem(
            2,
            'assets/icons/timer_outline.svg',
            'assets/icons/timer_filled.svg',
            'Timer',
            Timer(),
          ),
          _buildNavItem(
            3,
            'assets/icons/setting_outline.svg',
            'assets/icons/setting_fill.svg',
            'Settings',
            Settings(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    String outlinedIcon,
    String filledIcon,
    String label,
    Widget page,
  ) {
    final bool isActive = _selectedIndex == index;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isActive ? filledIcon : outlinedIcon,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              isActive
                  ? colorScheme.secondary
                  : (textTheme.bodyMedium?.color ?? AppColors.textSecondary),
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: AppFonts.body,
              fontWeight: AppFonts.semibold,
              color: isActive
                  ? colorScheme.secondary
                  : (textTheme.bodyMedium?.color ?? AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
