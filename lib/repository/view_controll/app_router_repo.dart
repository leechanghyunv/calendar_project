import 'package:calendar_project_240727/view_ui/screen/auth_screen/auth_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import '../../view_ui/main_screen_component/under_box_button_component/main_button.dart';
import '../../view_ui/screen/calendar_screen/calendar_screen.dart';
import '../../view_ui/screen/calendar_screen/provider/main_box_selector_provider.dart';
import '../../view_ui/screen/default_screen.dart';
import '../../view_ui/screen/statistic_screen/statistic_screen.dart';
import '../../view_ui/screen/user_statistics_screen/user_statistics_screen.dart';
import '../repository_import.dart';

part 'app_router_repo.g.dart';

@Riverpod(keepAlive: true) 
GoRouter router(ref) {

  final analytics = FirebaseAnalytics.instance;

  return GoRouter(
      navigatorKey: navigatorKey,
      observers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      debugLogDiagnostics: true,
      initialLocation: '/calendar',
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return DefaultScreen(
              buttom: [
                MainBoxSelectorProvider(),
                MainButton(),
              ],
              body: child,
            );
          },
          routes: [
            GoRoute(
              path: '/setting',
              name: 'setting',
              pageBuilder: (context, state) => NoTransitionPage(
                child: UserStatisticsScreen(),
              ),
            ),
            GoRoute(
              path: '/calendar',
              name: 'calendar',
              pageBuilder: (context, state) => NoTransitionPage(
                child: CalendarScreen(),
              ),
            ),
            GoRoute(
              path: '/statics',
              name: 'statics',
              pageBuilder: (context, state) => NoTransitionPage(
                child: StatisticScreen(),
              ),
            ),
          ],
        ),
      ]);
}

