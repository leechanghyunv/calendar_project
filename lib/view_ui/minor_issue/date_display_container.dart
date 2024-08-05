import 'package:calendar_project_240727/repository/calculate_day.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../repository/calendar_time_controll.dart';
import '../../view_model/filted_source_model.dart';


class DisplayContainer extends ConsumerWidget {
  const DisplayContainer({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final history = ref.watch(viewHistoryProvider);
    return history.when(
        data: (val) => DateContainerWidget(),
        error: (err,trace) => Container(
          height: 20.h,
        ),
        loading: () => Container(
          height: 20.h,
        ));
  }
}


class DateContainerWidget extends ConsumerWidget {
  const DateContainerWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final timeManager = ref.watch(timeManagerProvider);
    final extraDay = ref.watch(calculateValueProvider);
    final state = ref.watch(numericSourceModelProvider(timeManager.selected));
    final notifier =  ref.watch(numericSourceModelProvider(timeManager.selected).notifier);
    final workDay =notifier.workDay.isNaN ? 0 : notifier.workDay;



    return Padding(
      padding: EdgeInsets.fromLTRB(20, 2, 15.r, 0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                height: 20.h,
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Text(' 총 근로일수: $workDay일 + 주휴일수 $extraDay일  (실업급여조건 180일)',
                      style: TextStyle(color: Colors.grey[800],
                          fontWeight: FontWeight.w900,fontSize: 11.5.sp),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
