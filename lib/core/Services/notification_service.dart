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
    _startBackgroundListener();
    await _checkTerminatedMessage();

    // add this in initialize()
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      debugPrint('🔑 Token refreshed: $newToken');
      // save to Firestore user document
      // FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(FirebaseAuth.instance.currentUser?.uid)
      //     .update({'fcmToken': newToken});
    });
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

  // call this in initialize() after _startForegroundListener()
  void _startBackgroundListener() {
    // when app is in background and user taps notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('🔔 Opened from background: ${message.notification?.title}');
      _handleNotificationNavigation(message);
    });
  }

  Future<void> _checkTerminatedMessage() async {
    // when app is completely closed and user taps notification
    RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();
    if (initialMessage != null) {
      debugPrint(
        '🔔 Opened from terminated: ${initialMessage.notification?.title}',
      );
      _handleNotificationNavigation(initialMessage);
    }
  }

  void _handleNotificationNavigation(RemoteMessage message) {
    final String? screen = message.data['screen'];
    if (screen == null) return;

    switch (screen) {
      case 'home':
        navigatorKey.currentState?.pushNamed('/home');
        break;
      case 'tasks':
        navigatorKey.currentState?.pushNamed('/tasks');
        break;
      // add more routes as needed
    }
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
