import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import 'main.dart';

class MessagingService {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final _messageStreamController = BehaviorSubject<RemoteMessage>();

  Future<void> messagingPermission() async {
    try{
      final settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (kDebugMode) {
        print('Permission granted: ${settings.authorizationStatus}');
      }
    }catch(e){
      if (kDebugMode) {
        print('Error requesting permission: $e');
      }
    }

  }

  Future<void> getToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (kDebugMode) {
        print('Token: $token');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting token: $e');
      }
    }
  }

  void subscribeToMessages() {
    print('subscribeToMessages');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Handling a foreground message: ${message.messageId}');
        print('Message data: ${message.data}');
        print('Message notification: ${message.notification?.title}');
        print('Message notification: ${message.notification?.body}');
      }

      _messageStreamController.sink.add(message);
    });

    // TODO: Set up background message handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  }

}


// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // 앱이 백그라운드에서 실행 중일 때 메시지를 처리하는 로직
//   if (kDebugMode) {
//     print("Handling a background message: ${message.messageId}");
//   }
//   // 메시지 데이터를 사용하여 필요한 작업 수행
//   if (message.data.isNotEmpty) {
//     if (kDebugMode) {
//       print("Message data: ${message.data}");
//     }
//     // 예: 메시지 데이터를 사용하여 알림 표시
//     LocalNotificationManager.showNotification();
//   }
//   // 메시지의 알림 데이터를 사용하여 알림 표시
//   if (message.notification != null) {
//     if (kDebugMode) {
//       print("Message notification: ${message.notification!.body}");
//     }
//     // 예: 메시지 알림을 사용하여 알림 표시
//     LocalNotificationManager.showNotification();
//     // showNotification(message.notification!.title, message.notification!.body);
//   }
// }