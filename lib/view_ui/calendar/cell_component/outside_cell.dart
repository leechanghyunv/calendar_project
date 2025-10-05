
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';

import '../../../view_model/view_provider/calendar_switcher_model.dart';



class OutSideCell extends ConsumerWidget {

  final DateTime day;

  const OutSideCell({super.key, required this.day});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = context.width;
    final switcher = ref.watch(calendarSwitcherProvider);

    bool hasMarker = day.weekday ==
        DateTime.saturday; // Example condition for markers

    final textWidget = Text(
      '${day.day}',
      textScaler: TextScaler.noScaling,
      style: TextStyle(
        fontSize: switch (appWidth) {
          > 450 => 18.5,
          > 400 => 17,
          _ => 15,
        },
        fontWeight: FontWeight.w700,
        color: hasMarker ? Colors.blue.shade100 : Colors.grey.shade400,
      ),
    );


    return Container(
      margin:  EdgeInsets.all(4.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: switcher.maybeWhen(
        data: (useColumn) {
          if (useColumn) {
            return Column(
              children: [
                Spacer(),
                textWidget,
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
              ],
            );
          } else {
            return Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: textWidget,
                ),
              ],
            );
          }
        },
        // 로딩 중이거나 에러 상태에서는 기본값으로 Stack 사용
        orElse: () => Stack(
          alignment: Alignment.center,
          children: [Center(
            child: textWidget,
          )],
        ),
      ),
    );
  }
}



