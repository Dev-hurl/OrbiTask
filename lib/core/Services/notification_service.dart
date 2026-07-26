import 'dart:convert'; // Required for JSON encode/decode
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:orbitask/core/util/navigation_key.dart';

class NotificationService {
  NotificationService._privateConstructor();
  static final NotificationService instance =
      NotificationService._privateConstructor();

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _androidChannel =
      AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.max,
        playSound: true,
      );

  Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission();

    await _localNotifications.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _handleNotificationTap(response.payload);
      },
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_androidChannel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    _startForegroundListener();
  }

  void _startForegroundListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        // Enforce strong JSON conversion to extract structured keys later safely
        String jsonPayload = jsonEncode(message.data);

        _localNotifications.show(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
          notificationDetails: NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              importance: Importance.max,
              priority: Priority.high,
              icon: android.smallIcon ?? '@mipmap/ic_launcher',
            ),
          ),
          payload: jsonPayload,
        );
      }
    });
  }

  /// Triggers automatically on UI click
  void _handleNotificationTap(String? payloadString) {
    if (payloadString == null || payloadString.isEmpty) return;

    try {
      // 1. Decode string payload back into key/value map pairs
      Map<String, dynamic> data = jsonDecode(payloadString);

      // 2. Safely read destination arguments sent from your backend server
      String? screenToOpen = data['screen']; // Expecting e.g. "details"
      String? targetId = data['id']; // Expecting e.g. "45"

      if (screenToOpen == 'details') {
        // 3. Jump straight to details route using global key
        navigatorKey.currentState?.pushNamed('/details', arguments: targetId);
      }
    } catch (e) {
      debugPrint("Error routing notification tap: $e");
    }
  }
}
