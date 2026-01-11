import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../../base_app_size.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../../core/export_package.dart';

/// 달력 이동 버튼에 대한 간격을 설정하는 함수
double buttonBetween(double height, double width) {
  return switch ((height, width)) {
    (>= 800, > 400) => 25,
    (>= 800, _) => 17.5,
    _ => 15,
  };
}

class MonthMoveButton extends ConsumerStatefulWidget {

  const MonthMoveButton({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MonthMoveButton> createState() => _MonthMoveButtonState();
}

class _MonthMoveButtonState extends ConsumerState<MonthMoveButton> {


  @override
  Widget build(BuildContext context) {

    final appHeight = context.height;
    final appWidth = context.width;
    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;

    double IconSize = appWidth > 400 ? 37 : 32;

    void _onMonthChange(VoidCallback moveMonth) {
      HapticFeedback.selectionClick();
      moveMonth();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 8.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  Icons.chevron_left,
                  color: context.isDark ? Colors.grey.shade200 : Colors.grey.shade600,
                  size: IconSize,
                ),
              ),
              constraints: const BoxConstraints(maxHeight: 32),
              padding: EdgeInsets.zero,
              onPressed: () => _onMonthChange(ref.timeNot.movePreviousMonth),
            ),

            SizedBox(
                width: isFoldValue
                    ? 32.5
                    : buttonBetween(appHeight,appWidth),
            ),
            IconButton(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  Icons.chevron_right,
                  color: context.isDark ? Colors.grey.shade200 : Colors.grey.shade600,
                  size: IconSize,
                ),
              ),
              constraints: const BoxConstraints(maxHeight: 32),
              padding: EdgeInsets.zero,
              onPressed: () => _onMonthChange(ref.timeNot.moveNextMonth),
            ),
          ],
        ),
      ),
    );
  }
}