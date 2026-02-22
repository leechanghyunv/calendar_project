import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_extension.dart';

Widget initialText(BuildContext context,double height) {
  final fontSize = context.width.responsiveSize([15,14,14,13.5,13,12.5]);
  final baseStyle = TextStyle(
    height: Platform.isAndroid ? 1.6 : 1.20,
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
    color: context.chipTextColor,
  );
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '워크캘린더를 선택해주셔서 진심으로 감사합니다. 워크캘린더와 함께 반장님께서 원하시는 목표를 달성하시길 기원합니다.',
              style: baseStyle.copyWith(
              ),
            ),

          ],
        ),
        textScaler: TextScaler.noScaling,
      ),
      SizedBox(height: 5),



    ],
  );
}
