import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalNotification {
  static  String oneSignalAppId = dotenv.get('ONESIGNAL_ID');

  static void init() {
print('oneSignalAppId: $oneSignalAppId');
OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

OneSignal.initialize(oneSignalAppId);

OneSignal.Notifications.requestPermission(true);
  }
}

