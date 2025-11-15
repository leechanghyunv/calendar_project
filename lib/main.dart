import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/repository/view_controll/app_router_repo.dart';
import 'package:calendar_project_240727/view_model/view_provider/calendar_switcher_model.dart';
import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/b_type_switch_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/today_info_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/provider/statistic_switch_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app_review.dart';
import 'core/dark_light/dark_light.dart';
import 'firebase_options.dart';
import 'one_signal_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting();
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_KEY'),
  );

  final prefs = await SharedPreferences.getInstance();
  final count = prefs.getInt('app_count') ?? 0;
  await prefs.setInt('app_count', count + 1);


  runApp(ProviderScope(
      child: MyApp(),
  ),
  );
}


class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeMode = ref.watch(lightDarkModeProvider);
    final themeNotifier = ref.read(lightDarkModeProvider.notifier);

    final router = ref.watch(routerProvider);
    ref.watch(dynamicHolidaysProvider);
    ref.watch(bTypeSwitchProviderProvider);
    ref.watch(calendarSwitcherProvider);
    ref.watch(switchNotifierProvider);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]
    );

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 500), () async {
        final prefs = await SharedPreferences.getInstance();
        final count = prefs.getInt('app_count') ?? 0;
        final hasShownReview = prefs.getBool('review_shown') ?? false;
        if (count == 3) {
          OneSignalNotification.init();
          /// 유저 이탈율을 막고 oneSignal의 참여수를 증가시키고자 변경함
        }
        if (count == 5 && !hasShownReview) {
          /// 리뷰 독려 다이얼로그, 5번 이상 앱을 켰을때 진행
          await prefs.setBool('review_shown', true);
          final context = navigatorKey.currentContext;
          if (context != null && context.mounted){
            _showReview(context);
          };
        }

      });
      return null;
    }, []);

    return router.when(data: (router) {
      return ScreenUtilInit(
        designSize: const Size(390, 850),
        builder: (_, child) =>
            ShowCaseWidget(
              builder: (context) =>
                  StyledToast(
                    locale: const Locale('ko', 'KR'),
                    child: MaterialApp.router(

                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: const [
                        Locale('ko', 'KR'),
                      ],
                      debugShowCheckedModeBanner: false,
                      themeMode: themeMode,
                      theme: themeNotifier.lightMode,
                      darkTheme: themeNotifier.darkMode,
                      routerConfig: router,
                      builder: (context, child) {
                        return Scaffold(
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          body: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 475,
                              ),
                              child: child ?? const SizedBox(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            ),

      );
    },
      loading: () =>
       MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Loading.....')),
        ),
      ),
      error: (err, stack) =>
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('라우터 로딩 중 오류 발생'),
              ),
            ),
          ),
    );
  }

  Future<void> _showReview(context) async {
    showDialog(
        context: context,
        builder: (context) => CustomReviewDialog());
  }
}

