import '../../../core/export_package.dart';

Widget initialText(double height) {
  final fontSize = height >= 850 ? 15.5 : height > 750 ? 14.0 : 13.5;
  final baseStyle = TextStyle(
    height: Platform.isAndroid ? 1.6 : 1.20,
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
    color: Colors.grey.shade800,
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
