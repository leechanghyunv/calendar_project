import 'package:calendar_project_240727/view_ui/screen/main_screen.dart';
import 'package:calendar_project_240727/core/export.dart';
import 'package:flutter/foundation.dart';
import 'core/widget/toast_msg.dart';
import 'firebase_messaging.dart';
import 'firebase_options.dart';
import 'local_notification.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
/// 백그라운드에서 실행 중일 때 메시지 수신 리스너 설정
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  MessagingService messagingService = MessagingService();
  messagingService.messagingPermission();
  messagingService.getToken();
  messagingService.subscribeToMessages();

  await initializeDateFormatting();
  LocalNotificationManager.init();


  runApp( const ProviderScope(
      observers: [
        // Logger(),
      ],
      child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
    );

    return ScreenUtilInit(
      designSize: const Size(390, 850),
      builder: (_,child) =>
          ShowCaseWidget(
            builder: (context) => StyledToast(
              locale: const Locale('ko', 'KR'),
              child: MaterialApp(
                navigatorKey: navigatorKey,
                onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/main':
                    return PageTransition(
                      child: const MainScreen(),
                      type: PageTransitionType.fade,
                      settings: settings,
                    );
                  default:
                    return null;
                }
              },
              
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
              ),
              home: const MainScreen(),
              ),
            ),
          ),

    );
  }
}

