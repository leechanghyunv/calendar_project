import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../../core/export_package.dart';

/// 달력 이동 버튼에 대한 간격을 설정하는 함수
double buttonBetween(double height,double width) {
  if (height >= 800) {
    return width > 400 ? 25 : 17.5;
  } else if (height >= 700) {
    return 15;
  } else {
    return 15;
  }
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

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;

    double leftIconSize = appWidth > 450 ? 37 : 32;
    double rightIconSize = appWidth > 450 ? 37 : 32;

    void _animateIcon(bool isLeft) {
      setState(() {
        if (isLeft) {
          leftIconSize = appWidth > 450 ? 42 : 37;
        } else {
          rightIconSize = appWidth > 450 ? 42 : 37;
        }
      });

      Future.delayed(const Duration(milliseconds: 150), () {
        setState(() {
          if (isLeft) {
            leftIconSize = appWidth > 450 ? 37 : 32;
          } else {
            rightIconSize = appWidth > 450 ? 37 : 32;
          }
        });
      });
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            child: Icon(
              Icons.chevron_left,
              color: context.isDark ? Colors.grey.shade200 : Colors.grey.shade600,
              size: leftIconSize,
            ),
          ),
          constraints: const BoxConstraints(maxHeight: 32),
          padding: EdgeInsets.zero,
          onPressed: () {
            _animateIcon(true);
            ref.timeNot.movePreviousMonth();
          },
        ),

        SizedBox(
            width: isFoldValue
                ? 32.5
                : buttonBetween(appHeight,appWidth)),

        IconButton(
          icon: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            child: Icon(
              Icons.chevron_right,
              color: context.isDark ? Colors.grey.shade200 : Colors.grey.shade600,
              size: rightIconSize,
            ),
          ),
          constraints: const BoxConstraints(maxHeight: 32),
          padding: EdgeInsets.zero,
          onPressed: () {
            _animateIcon(false);
            ref.timeNot.moveNextMonth();
          },
        ),
      ],
    );
  }
}