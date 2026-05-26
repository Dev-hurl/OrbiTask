import 'package:flutter/material.dart';
import 'package:orbitask/Pages/Splash_Screen/splash_screen2.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:orbitask/constants/app_colors.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _expandController;
  late Animation<double> _animation;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeIn,
    );

    _expandAnimation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.easeOut,
    );

    // slide first → then expand → then navigate
    _slideController.forward().then((_) {
      _expandController.forward().then((_) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const SplashScreen2()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final maxRadius = size.longestSide * 2;

    return Scaffold(
      backgroundColor: AppColors.bgwhite,
      body: Stack(
        children: [
          // top left circle
          AnimatedBuilder(
            animation: Listenable.merge([_animation, _expandAnimation]),
            builder: (context, child) {
              final circleSize = 200 + (_expandAnimation.value * maxRadius);
              return Positioned(
                top: -100 + (_animation.value * 100) -
                    (_expandAnimation.value * maxRadius / 2),
                left: -100 + (_animation.value * 100) -
                    (_expandAnimation.value * maxRadius / 2),
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    color: Color(0xFF6B6BF5),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),

          // bottom right circle
          AnimatedBuilder(
            animation: Listenable.merge([_animation, _expandAnimation]),
            builder: (context, child) {
              final circleSize = 200 + (_expandAnimation.value * maxRadius);
              return Positioned(
                bottom: -100 + (_animation.value * 100) -
                    (_expandAnimation.value * maxRadius / 2),
                right: -100 + (_animation.value * 100) -
                    (_expandAnimation.value * maxRadius / 2),
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    color: AppColors.bgblue,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),

          // center logo + text — fades out during expand
          AnimatedBuilder(
            animation: _expandAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: 1 - _expandAnimation.value,
                child: child,
              );
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/OrbiTask blue.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '...Tasks in motion, Goals in Sight',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.regular,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}