import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_text_reveal/random_text_reveal.dart';

import '../../repository/calendar_time_controll.dart';
import '../calendar/calendar_widget.dart';
import '../minor_issue/date_display_container.dart';
import '../container/info_container.dart';
import '../minor_issue/default/default_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final timeManager = ref.watch(timeManagerProvider);
    final timeManagerNot = ref.read(timeManagerProvider.notifier);

    Widget sizeFrame(Widget widget) => MediaQuery.of(context).size.aspectRatio > 0.5
        ? SizedBox()
        : widget;

    return DefaultScreen(
        children: [
          sizeFrame(SizedBox(height: 30.w)),

          WorkCalender(
            selectedDay: timeManager.selected,
            focusedDay: timeManager.focused,
            onDaySelected: (DateTime? selected, DateTime? focused){
              timeManagerNot.onDaySelected(selected!, focused!);
            },
            onDayLongPressed: (DateTime? selected, DateTime? focused){

            },
            onPageChanged: (DateTime? focusedDay){
              timeManagerNot.onPageChanged(focusedDay);
            },
          ),
          sizeFrame(SizedBox(height: 15.w)),

          sizeFrame(DisplayContainer()),

          sizeFrame(SizedBox(height: 15.w)),

          InfoContainer(),

          Padding(
            padding: EdgeInsets.all(15.0.sp),
            child: Text('-----  L A F A Y E T T E  -----',
              style: TextStyle(fontSize: 12.5.sp,
                  fontWeight: FontWeight.w900,letterSpacing: 3.5),
            ),
          ),
        ]
    );
  }
}
