import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationManager {
  static final LocalNotificationManager shared = LocalNotificationManager._();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  LocalNotificationManager._();

  Future<void> init() async {
    await _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings(),
        macOS: null,
      ),
      //notificationTapBackground
      onDidReceiveBackgroundNotificationResponse: _onDidReceiveBackgroundNotificationResponse,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  Future<void> showNotificationWithNoBody({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      _getNotificationDetails(),
      payload: payload ?? '',
    );
  }

  Future<void> cancelAllNotifications() async {
    try {
      return _flutterLocalNotificationsPlugin.cancelAll();
    } catch (e, st) {
      if (kDebugMode) {
        print(st);
      }
    }
  }

  Future<void> _onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {}

  NotificationDetails _getNotificationDetails() {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'com.example.citavo',
      'Citavo',
      channelDescription: 'Citavo Notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'Citavo',
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: DarwinNotificationDetails(),
    );
    return platformChannelSpecifics;
  }
}

@pragma('vm:entry-point')
Future<void> _onDidReceiveBackgroundNotificationResponse(
  NotificationResponse notificationResponse,
) async {
  // Handle background notification response here
  print('Background notification action tapped: '
      '${notificationResponse.payload}');
}
