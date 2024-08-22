import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    Widget sizeFrame(Widget widget) =>
        MediaQuery.of(context).size.aspectRatio > 0.5 ? const SizedBox() : widget;

    return DefaultScreen(
        children: [
          sizeFrame(SizedBox(height: 30.w)),
          WorkCalender(
            selectedDay: timeManager.selected,
            focusedDay: timeManager.focused,
          ),
          MediaQuery.of(context).size.aspectRatio > 0.5
              ? SizedBox(height: 4.w)
              : SizedBox(height: 14.w),
          DisplayContainer(),
          MediaQuery.of(context).size.aspectRatio > 0.5
              ? SizedBox(height: 4.w)
              : SizedBox(height: 14.w),
          InfoContainer(),

          logo(),
        ]);

  }
}
