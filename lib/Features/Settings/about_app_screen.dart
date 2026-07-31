import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:orbitask/Widgets/toast/toast_service.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
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

    return Scaffold(
      appBar: AppBar(leading: BackButton(color: colorScheme.secondary)),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            //App Icon
            Container(
              width: 100,
              height: 100,
              color: colorScheme.onSurfaceVariant,
              alignment: Alignment.center,
              child: Text(
                'App Icon',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.buttonPrimary,
                  fontWeight: AppFonts.semibold,
                ),
              ),
            ),
            SizedBox(height: 12),
            //Version number
            Center(
              child: Text(
                _appVersion.isEmpty ? 'Loading version...' : _appVersion,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
            ),
            //Terms & Conditions
            _buildSettingsItem(
              context,
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedShield02,
                size: 24,
                color: colorScheme.secondary,
              ),
              label: 'Terms and Conditions',
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
            SizedBox(height: 16),
            //Privacy Policy
            _buildSettingsItem(
              context,
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedCustomerService01,
                size: 24,
                color: colorScheme.secondary,
              ),
              label: 'Contact Support',
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
            SizedBox(height: 16),
            //Version Upgrade
            _buildSettingsItem(
              context,
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedStartUp02,
                color: colorScheme.secondary,
              ),
              label: 'Version Upgrade',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSettingsItem(
  BuildContext context, {
  required Widget icon,
  required String label,
  required VoidCallback onTap,
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
