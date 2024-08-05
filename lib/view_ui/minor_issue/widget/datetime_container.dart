
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../repository/calendar_time_controll.dart';

class DateContainerWidget extends ConsumerWidget {
  const DateContainerWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final timeManager = ref.watch(timeManagerProvider);
    final selectedMonth = timeManager.selected.month;
    final selectedDay = timeManager.selected.day;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 2, 25.r, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          Container(
            width: 300.w,
            height: 20.h,
            color: Colors.transparent,
            alignment: Alignment.centerRight,
            child: Text('$selectedMonth월 $selectedDay일을 선택하셨습니다',
              style: TextStyle(color: Colors.grey[800],
                  fontWeight: FontWeight.w900),
            ),
          ),

        ],
      ),
    );
  }
}
