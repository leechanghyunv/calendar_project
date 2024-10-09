import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import 'main.dart';

class MessagingService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final _messageStreamController = BehaviorSubject<RemoteMessage>();

  Future<void> messagingPermission() async {
    try{
      final settings = await messaging.requestPermission(
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
      final token = await messaging.getToken();
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
