import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Main/create_task1.dart';
import 'package:orbitask/Widgets/custom_nav_bar.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(
            'assets/images/avatar.jpg'),
        ),
        title: Column(
          children: [
            Text(
              'Hello, Emmanuel',
              style: TextStyle(
                fontSize:AppFonts.subheading,
                fontWeight: AppFonts.semibold,
                color: AppColors.textPrimary,
              )
            ),
            Text(
              'welcome back',
              style: TextStyle(
                fontSize:AppFonts.body,
                fontWeight: AppFonts.medium,
                color: AppColors.textSecondary,
              )
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/calendar-03-stroke-rounded.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppColors.bgblue, 
                BlendMode.srcIn),
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
                AppColors.bgblue, 
                BlendMode.srcIn),
            ),
            color: AppColors.bgblue,
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
        
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/task list.svg',
                width: 100,
                height: 100,
                colorFilter: ColorFilter.mode(
                  AppColors.bgblue, 
                  BlendMode.srcIn),
              ),
              SizedBox(height: 8,),
              Text(
                'Create a task to efficiently manage your time.',
                style: TextStyle(
                  fontSize:AppFonts.body,
                  fontWeight: AppFonts.regular,
                  color: AppColors.textSecondary,
                )
              ),
              SizedBox(height: 24,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bgblue,
                  fixedSize: Size(200, 48),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateTask1()),
                ),
                child: Text(
                  'Create a Task',
                  style: TextStyle(
                    fontSize: AppFonts.body,
                    fontWeight: AppFonts.medium,
                    color: AppColors.bgwhite,
                  ),
                ),
              ),
            ],
          ),
        )
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
          backgroundColor: AppColors.bgblue50,
          child: Icon(Icons.add, 
          color: AppColors.bgblue),
        ),
      ),
    );
  }
}