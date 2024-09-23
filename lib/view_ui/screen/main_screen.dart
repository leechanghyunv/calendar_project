import 'package:calendar_project_240727/core/export.dart';

import '../../repository/calendar_time_controll.dart';
import '../calendar/calendar_widget.dart';
import '../logo.dart';
import '../minor_issue/date_display_container.dart';
import '../container/info_container.dart';
import '../minor_issue/default/default_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final timeManager = ref.watch(timeManagerProvider);
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;

    Widget sizeFrame(Widget widget) =>
        appHeight < 700 ? const SizedBox() : widget;

    Widget GalaxyZFoldCalendar(Widget widget) =>
        appWidth > 500 ? Container(
          width: appWidth * 0.6,
            child: widget) : widget;

    return DefaultScreen(
        children: [
          sizeFrame(SizedBox(height: 30.h)),

          GalaxyZFoldCalendar(
            WorkCalender(
            selectedDay: timeManager.selected,
            focusedDay: timeManager.focused,
          ),
          ),



          appHeight < 700
              ? SizedBox(height: 4.h)

              : appHeight > 800
              ? SizedBox(height: 10.h)
              : SizedBox(height: 14.h),

          DisplayContainer(),
          appHeight < 700
              ? SizedBox(height: 4.h)

              : appHeight > 800
              ? SizedBox(height: 10.h)
              : SizedBox(height: 14.h),
          InfoContainer(),

          logo(appWidth),
        ]);

  }
}
