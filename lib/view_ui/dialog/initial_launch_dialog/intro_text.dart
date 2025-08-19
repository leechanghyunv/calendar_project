import '../../../core/export_package.dart';

Widget initialText(double height) {
  final fontSize = height >= 850 ? 15.5 : height > 750 ? 14.0 : 13.5;
  final baseStyle = TextStyle(
    height: Platform.isAndroid ? 1.6 : 1.20,
    fontWeight: FontWeight.w500,
    fontSize: fontSize,
    color: Colors.black,
  );
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '아직은 유명하지 않은 워크캘린더를 선택해주셔서 감사합니다. 워크캘린더와 함께 원하시는 목표를 달성하시길 기원합니다.',
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
