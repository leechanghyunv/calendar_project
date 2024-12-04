
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widget/text_widget.dart';
import 'decimal_dialog.dart';

class DecimalPayTextfield extends ConsumerWidget {
  const DecimalPayTextfield({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    return Padding(
        padding:  EdgeInsets.fromLTRB(
            10.0,
            appHeight > 700 ? 8.0.sp : 3.0.sp,
            10.0,
            0.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const DecimalDialog(),
              );
            },
            child: DecimalTextButton(appWidth),
          ),
        ));
  }
}

Widget DecimalTextButton(double appWidth) {

  int repeatCount = 0;

  return Container(
    width: 100.w,
    height: appWidth > 500 ? 17.5.w : 35.w,
    alignment: Alignment.center,
    decoration: BoxDecoration(

    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 1.5),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            height: 100.w,
            width: 3.75.h,
            color: Colors.purple.shade800,
          ).animate(
            onPlay: (controller) {
              if (repeatCount < 5) {
                repeatCount++;
                controller.repeat(reverse: true);
              }
            },
          ).tint(
            duration: 1.0.seconds,
            color: Colors.purple.shade200,
            curve: Curves.easeInOut,
          ),
        ),
        const SizedBox(width: 7.5),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget('근무 유형 직접 입력하기', 15, appWidth),

              ],
            ),
            Row(
              children: [
                TextWidget2(
                    '휴무 포함,', 8,
                    Colors.purple.shade700,appWidth),
                TextWidget2(
                    ' 0.25공수, 0.75공수 등록', 8,
                    Colors.purple.shade700,appWidth),
              ],
            ),
          ],
        ),

      ],
    ),
  );
}


