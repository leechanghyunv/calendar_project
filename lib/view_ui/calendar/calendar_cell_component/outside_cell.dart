
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../../view_model/view_provider/calendar_switcher_model.dart';
import 'cell_size.dart';

class OutSideCell extends ConsumerWidget {

  final DateTime day;

  const OutSideCell({super.key, required this.day});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = context.width;
    final appHeight = context.height;
    final switcher = ref.watch(calendarSwitcherProvider);
    bool hasMarker = day.weekday == DateTime.saturday;
    bool hasMarker2 = day.weekday == DateTime.sunday;

    final sizes = CellSizes(
        appHeight: appHeight,
        appWidth: appWidth);

    final textWidget = Text(
      '${day.day}',
      textScaler: TextScaler.noScaling,
      style: TextStyle(
        fontSize: sizes.defaultSize,
        fontWeight: FontWeight.w700,
        color: hasMarker ? context.isDark ? Colors.grey.shade700 : Colors.blue.shade100
             : hasMarker2 ? Colors.teal.shade100
             : context.isDark ? Colors.grey.shade700 : Colors.grey.shade300,
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



