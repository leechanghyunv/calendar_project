import 'package:calendar_project_240727/core/export_package.dart';

import '../../repository/time/calendar_time_controll.dart';
import '../calendar/calendar_widget.dart';
import '../minor_issue/logo.dart';
import '../container/date_display_container.dart';
import '../container/info_container.dart';
import '../minor_issue/default/default_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final selecter = ref.watch(timeManagerProvider.notifier).shouldEnlarge();

    Widget sizeFrame(Widget widget) =>
        appHeight < 700 ? const SizedBox() : widget;

    Widget GalaxyZFoldCalendar(Widget widget) =>
        appWidth > 500 ? SizedBox(
          width: appWidth * 0.6,
            child: widget) : widget;

    Widget voidSpace() => appHeight < 700
        ? SizedBox(height: 4.h)
        : appHeight > 800
        ? SizedBox(height: 10.h)
        : appWidth < 370 ? SizedBox(height: 10.h) : SizedBox(height: 14.h);

    return DefaultScreen(
        children: [
          sizeFrame(SizedBox(height: appWidth < 370 ? 10.h : 30.h)),
          GalaxyZFoldCalendar(WorkCalendar()),
          selecter ? SizedBox() : voidSpace(),
          const DisplayContainer(),
          voidSpace(),
          const InfoContainer(),
          selecter ? SizedBox() : logo(appWidth),

        ]);

  }
}
