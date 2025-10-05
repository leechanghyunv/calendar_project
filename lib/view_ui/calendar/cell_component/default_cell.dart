import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';

import '/../../view_model/view_provider/calendar_switcher_model.dart';



class DefaultCell extends ConsumerWidget {
  final DateTime date;
  final Color textColor;

  const DefaultCell({super.key, required this.date, required this.textColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = context.width;
    final switcher = ref.watch(calendarSwitcherProvider);

    // 텍스트 위젯을 별도로 정의
    final textWidget = Text(
      '${date.day}',
      textScaler: TextScaler.noScaling,
      style: TextStyle(
        fontSize: switch (appWidth) {
          > 450 => 20,
          > 400 => 17,
          > 370 => 14,
          _ => 15,
        },
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
    );

    return Container(
      margin: EdgeInsets.all(4.0.r),
      decoration: BoxDecoration(
        // color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      // AsyncValue 상태에 따라 위젯 처리
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
          children: [
            Center(
              child: textWidget,
          )],
        ),
      ),
    );
  }
}

