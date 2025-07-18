import '../../../core/export_package.dart';

Widget initialText(double height) {
  final fontSize = height >= 850 ? 15.5 : height > 750 ? 14.0 : 13.5;
  final baseStyle = TextStyle(
    height: Platform.isAndroid ? 1.6 : 1.20,
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
              text: '근무지,직무',
              style: baseStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: fontSize + 1.25,
              ),
            ),
            TextSpan(
              text: '에 대한 아주 간단한 설정이 있습니다. ',
              style: baseStyle.copyWith(
              ),
            ),
            TextSpan(
              text: ' 선택사항이며, 건너뛰기가 가능합니다. ',
              style: baseStyle.copyWith(
              ),
            ),
            TextSpan(
              text: '통계 자료로 활용',
              style: baseStyle.copyWith(
                backgroundColor: Colors.green.shade100,
                fontWeight: FontWeight.w700,
                fontSize: fontSize + 1.25,
              ),
            ),
            TextSpan(
              text: ' 됩니다.',
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
