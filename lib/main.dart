import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:calendar_project_240727/view_ui/screen/main_screen.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/widget/toast_msg.dart';
import 'firebase_options.dart';
import 'local_notification.dart';
import 'one_signal_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  OneSignalNotification.init();
  await initializeDateFormatting();
  LocalNotificationManager.init();

  runApp(ProviderScope(
      child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final analytics = FirebaseAnalytics.instance;

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
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ko', 'KR'),
                ],
                navigatorObservers: [
                  FirebaseAnalyticsObserver(analytics: analytics),
                ],

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

