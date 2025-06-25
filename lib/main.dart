import 'package:calendar_project_240727/repository/view_controll/app_router_repo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

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
  runApp(ProviderScope(
      child: MyApp(),
  ),
  );
}


class MyApp extends HookConsumerWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final router = ref.watch(routerProvider);

    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
    );

    return ScreenUtilInit(
      designSize: const Size(390, 850),
      builder: (_,child) =>
          ShowCaseWidget(
            builder: (context) => StyledToast(
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
              theme: ThemeData(
                useMaterial3: false,
              ),
                routerConfig: router,
                builder: (context, child) {
                  return Scaffold(
                    backgroundColor: Colors.grey.shade50,
                    body: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 470,
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
  }
}

