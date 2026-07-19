import 'package:flutter/material.dart';
import 'package:orbitask/Features/provider/theme_notifier.dart';
import 'package:orbitask/Pages/Account%20Creation/change_password.dart';
import 'package:orbitask/Pages/Account%20Creation/sign_in.dart';
import 'package:orbitask/Pages/Services/auth_services.dart';
import 'package:orbitask/Widgets/custom_nav_bar.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: AppFonts.subheading,
            fontWeight: AppFonts.semibold,
            color: AppColors.textPrimary,
          ),
        ),
        leading: BackButton(color: AppColors.textPrimary),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildSectionHeader('General'),
          SizedBox(height: 8),
          _buildThemeToggle(context),
          _buildSettingsItem(
            context,
            icon: Icons.person_outline,
            label: 'Account',
            onTap: () {},
          ),
          _buildSettingsItem(
            context,
            icon: Icons.lock_outline,
            label: 'Change Password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePassword()),
              );
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.notifications_outlined,
            label: 'Notification',
            onTap: () {},
          ),

          SizedBox(height: 24),

          _buildSectionHeader('About'),
          SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: Icons.headset_mic_outlined,
            label: 'Support',
            onTap: () {},
          ),
          _buildSettingsItem(
            context,
            icon: Icons.shield_outlined,
            label: 'Terms and Conditions',
            onTap: () {},
          ),

          SizedBox(height: 24),

          _buildSettingsItem(
            context,
            icon: Icons.logout,
            label: 'Logout',
            iconColor: Colors.red,
            labelColor: Colors.red,
            onTap: () async {
              final navigator = Navigator.of(context);
              await _authService.signOut();
              if (!mounted) return;
              navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Signin()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: AppFonts.caption,
        fontWeight: AppFonts.medium,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? iconColor,
    Color? labelColor,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(icon, color: iconColor ?? AppColors.bgblue, size: 22),
          title: Text(
            label,
            style: TextStyle(
              fontSize: AppFonts.body,
              fontWeight: AppFonts.medium,
              color: labelColor ?? AppColors.textPrimary,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.textSecondary,
            size: 16,
          ),
        ),
        Divider(color: AppColors.shark100, height: 1),
      ],
    );
  }
}

Widget _buildThemeToggle(BuildContext context) {
  final themeNotifier = context.watch<ThemeNotifier>();
  return Column(
    children: [
      ListTile(
        leading: Icon(
          themeNotifier.isDarkMode
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined,
          color: AppColors.bgblue,
          size: 22,
        ),
        title: Text(
          'Dark Mode',
          style: TextStyle(
            fontSize: AppFonts.body,
            fontWeight: AppFonts.medium,
            color: AppColors.textPrimary,
          ),
        ),
        trailing: Switch(
          value: themeNotifier.isDarkMode,
          onChanged: (_) => themeNotifier.toggleTheme(),
          activeThumbColor: AppColors.accent,
        ),
      ),
      Divider(color: AppColors.shark100, height: 1),
    ],
  );
}
