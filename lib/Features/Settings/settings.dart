import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:orbitask/Features/Auth/screens/Verification/change_password.dart';
import 'package:orbitask/Features/Notification/enable_notification.dart';
import 'package:orbitask/Features/provider/theme_notifier.dart';
import 'package:orbitask/Features/Auth/screens/sign_in.dart';
import 'package:orbitask/Features/Proflie/account_page.dart';
import 'package:orbitask/Widgets/Custom%20Widgets/custom_dialog.dart';
import 'package:orbitask/Widgets/toast/toast_service.dart';
import 'package:orbitask/core/Services/auth_services.dart';
import 'package:orbitask/Widgets/Custom%20Widgets/custom_nav_bar.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _authService = AuthService();
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = 'Version ${info.version} (${info.buildNumber})';
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: textTheme.bodyLarge?.copyWith(
            fontSize: AppFonts.subheading,
            fontWeight: AppFonts.semibold,
          ),
        ),
        leading: BackButton(color: colorScheme.secondary),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // profile header
          Center(
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountPage()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: user?.photoURL != null
                        ? NetworkImage(user!.photoURL!)
                        : null,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    child: user?.photoURL == null
                        ? Icon(
                            Icons.person,
                            size: 40,
                            color: colorScheme.secondary,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  user?.displayName ?? 'OrbiTask User',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: AppFonts.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user?.email ?? '',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
          _buildSectionHeader('General'),
          SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedUser,
              size: 24,
              color: colorScheme.secondary,
            ),
            label: 'Account',
            subtitle: 'Manage your personal information',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
          ),
          SizedBox(height: 24),
          _buildSectionHeader('Privacy & Security'),
          SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedSquareLockPassword,
              size: 24,
              color: colorScheme.secondary,
            ),
            label: 'Change Password',
            subtitle: 'Update your account password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePassword()),
              );
            },
          ),
          SizedBox(height: 24),

          _buildSectionHeader('Preferences'),
          SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedNotification01,
              size: 24,
              color: colorScheme.secondary,
            ),
            label: 'Enable Notification',
            subtitle: 'Control how you receive alerts',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EnableNotification()),
              );
            },
          ),
          _buildThemeToggle(context),
          SizedBox(height: 24),

          _buildSectionHeader('About'),
          SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedShield02,
              size: 24,
              color: colorScheme.secondary,
            ),
            label: 'Terms and Conditions',
            subtitle: 'Read our terms of service',
            onTap: () {
              ToastService.instance.show(
                context: context,
                text: 'Suggest a feature',
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedStartUp02,
                  color: colorScheme.onSurface,
                  size: 20,
                ),
              );
            },
          ),
          _buildSettingsItem(
            context,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedCustomerService01,
              size: 24,
              color: colorScheme.secondary,
            ),
            label: 'Contact Support',
            subtitle: 'Get help from our team',
            onTap: () {
              ToastService.instance.show(
                context: context,
                text: 'Coming soon — stay tuned!',
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedStartUp02,
                  color: colorScheme.onSurface,
                  size: 20,
                ),
              );
            },
          ),

          SizedBox(height: 24),
          _buildSectionHeader('Session'),
          SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedLogout02,
              size: 24,
              color: colorScheme.error,
            ),
            label: 'Logout',
            subtitle: 'Sign out of your account',
            iconColor: colorScheme.error,
            labelColor: colorScheme.error,
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => CustomDialog(
                  title: 'Log Out',
                  message: 'Are you sure you want to log out?',
                  confirmText: 'Log Out',
                  onConfirm: () async {
                    final navigator = Navigator.of(
                      context,
                    ); // ← store before await
                    await _authService.signOut();
                    navigator.pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => Signin()),
                      (route) => false,
                    );
                  },
                ),
              );
            },
          ),
          _buildSettingsItem(
            context,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedDelete03,
              size: 24,
              color: colorScheme.error,
            ),
            iconColor: colorScheme.error,
            labelColor: colorScheme.error,
            label: 'Delete Account',
            subtitle: 'Permanently remove your account and data',
            onTap: () {
              //check for user id in firebase auth, firestore
              //delete every info relating to them
              //log them out
              //go to signup screen
            },
          ),
          SizedBox(height: 24),
          Center(
            child: Text(
              _appVersion.isEmpty ? 'Loading version...' : _appVersion,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildSectionHeader(String title) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      title,
      style: textTheme.bodyMedium?.copyWith(fontSize: AppFonts.body),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required Widget icon,
    required String label,
    required String subtitle,
    required VoidCallback onTap,
    Color? iconColor,
    Color? labelColor,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: icon,
          title: Text(
            label,
            style: textTheme.bodyLarge?.copyWith(
              color: labelColor ?? colorScheme.onSurface,
            ),
          ),
          subtitle: Text(subtitle, style: textTheme.bodySmall),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.textSecondary,
            size: 16,
          ),
        ),
        //Divider(color: colorScheme.surfaceContainerHighest, height: 1),
      ],
    );
  }
}

Widget _buildThemeToggle(BuildContext context) {
  final themeNotifier = context.watch<ThemeNotifier>();
  final textTheme = Theme.of(context).textTheme;
  final colorScheme = Theme.of(context).colorScheme;

  return ListTile(
    leading: Icon(
      themeNotifier.isDarkMode
          ? Icons.dark_mode_outlined
          : Icons.light_mode_outlined,
      color: colorScheme.secondary,
      size: 22,
    ),
    title: Text(
      themeNotifier.isDarkMode ? 'Dark Mode' : 'Light Mode',
      style: textTheme.bodyLarge,
    ),
    subtitle: Text(
      themeNotifier.isDarkMode
          ? 'Switch to light theme'
          : 'Switch to dark theme',
      style: textTheme.bodySmall?.copyWith(
        color: colorScheme.onSurface.withValues(alpha: 0.5),
      ),
    ),
    trailing: Switch(
      value: themeNotifier.isDarkMode,
      thumbIcon: WidgetStateProperty<Icon?>.fromMap({
        WidgetState.selected: Icon(Icons.dark_mode_rounded),
        WidgetState.any: Icon(Icons.light_mode_rounded),
      }),
      onChanged: (_) => themeNotifier.toggleTheme(),
      activeThumbColor: colorScheme.secondary,
    ),
  );
}
