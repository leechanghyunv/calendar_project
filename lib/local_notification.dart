import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotificationManager {
  static  final FlutterLocalNotificationsPlugin _local = FlutterLocalNotificationsPlugin();

   static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
        requestSoundPermission: true, requestBadgePermission: true, requestAlertPermission: true);

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _local.initialize(initializationSettings);
    requestPermissions();
  }

static void requestPermissions() {
    _local.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
    iOS: DarwinNotificationDetails(
      badgeNumber: 1,
    ));
    await _local.show(
      0,
      'firebase messaging title',
      'firebase messaging body',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}




