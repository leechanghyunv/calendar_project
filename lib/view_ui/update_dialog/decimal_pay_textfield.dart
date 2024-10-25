
import 'package:calendar_project_240727/core/export.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/widget/text_widget.dart';
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
            appHeight > 700 ? 8.0.sp : 1.0.sp,
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



Widget DecimalTextButton(double appWidth) => Container(
  width: appWidth > 500 ? 50.w : 100.w,
  height: appWidth > 500 ? 25.w : 50.w,
  alignment: Alignment.center,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '근무 유형 직접 입력하기',
            style:
            TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Platform.isAndroid
                    ? appWidth > 500? (15 - 1.0).sp/2 : (15 - 1.0).sp
                    : appWidth > 500? 7.5.sp : 15.sp,
            ),

          ),
        ],
      ),
      Row(
        children: [
          TextWidget2(
              '휴무 포함,',
              Platform.isAndroid
                  ? appWidth > 500? 3.5.sp : 7.sp
                  : appWidth > 500? 4.sp : 8.sp,
              Colors.purple.shade900,appWidth),


          TextWidget2(
              ' 0.25공수, 0.75공수 등록',
              Platform.isAndroid
                  ? appWidth > 500? 3.5.sp : 7.sp
                  : appWidth > 500? 4.sp : 8.sp,
              Colors.purple.shade900,appWidth),
        ],
      ),
    ],
  ),
);


