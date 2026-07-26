import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';


class Notifications extends StatelessWidget {
  Future<void> sendTestNotification() async {
    try {
      // 1. load service account JSON
      final String jsonStr = await rootBundle.loadString(
        'assets/secrets/service_account.json',
      );
      final Map<String, dynamic> jsonData = jsonDecode(jsonStr);

      // 2. create credentials
      final credentials = ServiceAccountCredentials.fromJson(jsonData);

      // 3. get access token
      final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
      final authClient = await clientViaServiceAccount(credentials, scopes);

      // 4. get FCM device token
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken == null) {
        debugPrint('❌ No FCM token found');
        return;
      }

      // 5. get project ID from service account
      final String projectId = jsonData['project_id'];

      // 6. send notification via FCM V1 API
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

  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: sendTestNotification,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onPrimary,
          ),
          child: Text('Send Test Notification'),
        ),
      ),
    );
  }
}
