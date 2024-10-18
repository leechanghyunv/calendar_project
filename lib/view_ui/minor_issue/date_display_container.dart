import 'package:calendar_project_240727/core/export.dart';
import 'package:calendar_project_240727/repository/calculate_day.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';

import '../../core/showcase_global_key.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/filted_source_model.dart';


class DisplayContainer extends ConsumerWidget {
  const DisplayContainer({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final history = ref.watch(viewHistoryProvider);
    return history.when(
        data: (val) => const DateContainerWidget(),
        error: (err,trace) =>
            SizedBox(
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: const Row(
                children: [

                ],
              ),

        ),
        loading: () =>
            SizedBox(
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: const Row(),
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
    final appWidth = MediaQuery.of(context).size.width;
    final percentage = (workDay/180 * 100);
    final String present = (percentage > 100 ? 100 : percentage).toStringAsFixed(1);

    TextStyle textStyle = TextStyle(
      color: Colors.grey[800],
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
      fontSize: Platform.isAndroid
          ? appWidth > 500 ? (11.5 - 1.0).sp/2 : (11.5 - 1.0).sp
          :  appWidth > 500 ? 5.7.sp : 11.5.sp,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w,
          2.h,
          appWidth > 500? 100.w : 20.w,
          2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 20,
            color: Colors.transparent,
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                Tooltip(
                  message: '산정기준에는 주휴일수가 포함되지 않습니다.\n실업급여조건은 근로일수 180일 입니다',
                  child: Text(
                    '총 근로일수 $workDay일,주휴일수 $extraDay일 (실업급여조건 180일 $present%)',
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),//
        ],
      ),
    );
  }
}
