import 'package:calendar_project_240727/view_ui/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';
import 'core/logger.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting();
  runApp( ProviderScope(
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
      designSize:  Size(390, 850),
      builder: (_,child) => MaterialApp(

        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/main':
              return PageTransition(
                child: MainScreen(),
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
        home: MainScreen(),

      ),
    );
  }
}

