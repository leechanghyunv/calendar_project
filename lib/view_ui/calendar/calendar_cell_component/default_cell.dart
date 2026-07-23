import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/view_model/view_provider/calendar_switcher_model.dart';
import 'package:calendar_project_240727/view_model/view_provider/is_galaxy_fold.dart';
import 'cell_size.dart';

class DefaultCell extends ConsumerWidget {
  final DateTime date;
  final Color textColor;

  const DefaultCell({super.key, required this.date, required this.textColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = context.width;
    final appHeight = context.height;
    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFlip = ref.watch(isGalaxyFlipProvider);
    final isFoldValue = isFold.asData?.value ?? false;
    final isFlipValue = isFlip.asData?.value ?? false;
    final switcher = ref.watch(calendarSwitcherProvider);


    final sizes = CellSizes(
        appHeight: appHeight,
        appWidth: appWidth,
        isFold: isFoldValue,
        isFlip: isFlipValue,
        );

    // 텍스트 위젯을 별도로 정의
    final textWidget = Text(
      '${date.day}',
      textScaler: TextScaler.noScaling,
      style: TextStyle(
        fontSize: sizes.defaultSize,
        fontWeight: Platform.isAndroid ?  FontWeight.w600 : FontWeight.w700,
        color: textColor,
      ),
    );

    return Container(
      margin: EdgeInsets.all(4.0.r),
      decoration: BoxDecoration(
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

