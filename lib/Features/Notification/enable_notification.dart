import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:orbitask/constants/app_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnableNotification extends StatefulWidget {
  const EnableNotification({super.key});

  @override
  State<EnableNotification> createState() => _EnableNotificationState();
}

class _EnableNotificationState extends State<EnableNotification> {
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadNotificationStatus();
  }

  // check actual permission status and sync with toggle
  Future<void> _loadNotificationStatus() async {
    final settings = await FirebaseMessaging.instance.getNotificationSettings();
    final isGranted =
        settings.authorizationStatus == AuthorizationStatus.authorized;

    // save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationsEnabled', isGranted);

    if (mounted) {
      setState(() {
        _isEnabled = isGranted;
      });
    }
  }

  // called when user taps toggle
  Future<void> _handleToggle(bool value) async {
    if (value) {
      // user wants to enable — request permission
      final settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      final isGranted =
          settings.authorizationStatus == AuthorizationStatus.authorized;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('notificationsEnabled', isGranted);

      if (mounted) {
        setState(() => _isEnabled = isGranted);

        if (!isGranted) {
          // user denied — show dialog to open settings
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Notifications Blocked'),
              content: Text(
                'You\'ve blocked notifications. Go to your device settings to enable them.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    openAppSettings(); // opens device settings
                  },
                  child: Text('Open Settings'),
                ),
              ],
            ),
          );
        }
      }
    } else {
      // user wants to disable — can't do programmatically, open settings
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Disable Notifications'),
          content: Text(
            'To disable notifications, go to your device settings.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                openAppSettings();
              },
              child: Text('Open Settings'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> sendTestNotification() async {
    if (!_isEnabled) {
      debugPrint('❌ Notifications not enabled');
      return;
    }

    if (kIsWeb) {
      debugPrint('❌ Not supported on web');
      return;
    }
    try {
      final String jsonStr = await rootBundle.loadString(
        'assets/secrets/service_account.json',
      );
      final Map<String, dynamic> jsonData = jsonDecode(jsonStr);
      final credentials = ServiceAccountCredentials.fromJson(jsonData);
      final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
      final authClient = await clientViaServiceAccount(credentials, scopes);
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken == null) {
        debugPrint('❌ No FCM token found');
        return;
      }
      final String projectId = jsonData['project_id'];
      final response = await authClient.post(
        Uri.parse(
          'https://fcm.googleapis.com/v1/projects/$projectId/messages:send',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'message': {
            'token': fcmToken,
            'notification': {
              'title': 'Test Notification 🚀',
              'body': 'Hello from OrbiTask!',
            },
            'data': {'screen': 'home'},
          },
        }),
      );

      if (response.statusCode == 200) {
        debugPrint('✅ Notification sent!');
      } else {
        debugPrint('❌ Failed: ${response.body}');
      }
      authClient.close();
    } catch (e) {
      debugPrint('❌ Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Enable Notifications',
          style: textTheme.bodyLarge?.copyWith(
            fontSize: AppFonts.subheading,
            fontWeight: AppFonts.semibold,
          ),
        ),
        leading: BackButton(color: colorScheme.secondary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // toggle
            ListTile(
              leading: HugeIcon(
                icon: HugeIcons.strokeRoundedNotification01,
                color: colorScheme.secondary,
                size: 22,
              ),
              title: Text(
                'Enable Notifications',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: AppFonts.semibold,
                ),
              ),
              trailing: Switch(
                value: _isEnabled,
                activeThumbColor: colorScheme.secondary,
                thumbIcon: WidgetStateProperty<Icon?>.fromMap({
                  WidgetState.selected: Icon(Icons.notifications_on),
                  WidgetState.any: Icon(Icons.notifications_off),
                }),
                onChanged: _handleToggle,
              ),
            ),

            SizedBox(height: 12),

            Divider(color: colorScheme.surfaceContainerHighest),

            SizedBox(height: 12),

            // send test notification — only shows if enabled
            if (_isEnabled)
              ListTile(
                onTap: sendTestNotification,
                title: Text(
                  'Send Push Notification',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFonts.semibold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              )
            else
              ListTile(
                leading: Icon(
                  Icons.notifications_off,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                  size: 22,
                ),
                title: Text(
                  'Notifications Disabled',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}