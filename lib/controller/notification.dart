import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  NotificationManager._();

  static const String _CHANNEL_ID = 'timer notify';
  static const String _CHANNEL_NAME = '타이머 알림';
  static const String _CHANNEL_DESCRIPTION = '타이머 알림입니다.';

  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static init() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static requestNotificationPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  ///   Timer Notification
  static Future<void> sendNotificationForTimer() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(_CHANNEL_ID, _CHANNEL_NAME,
            channelDescription: _CHANNEL_DESCRIPTION,
            importance: Importance.max,
            priority: Priority.max,
            showWhen: true);

    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: DarwinNotificationDetails(badgeNumber: 1));

    await _flutterLocalNotificationsPlugin.show(0, '굽기 완료', '화면을 확인해주세요!', notificationDetails);
  }
}
