import '../../../core/export_package.dart';

Widget initialText(double height) {
  final fontSize = height >= 850 ? 15.5 : height > 750 ? 14.0 : 13.5;
  final baseStyle = TextStyle(
    height: Platform.isAndroid ? 1.6 : 1.20,
    fontSize: fontSize,
    color: Colors.black,
  );
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: '우선 근로조건 설정',
          style: baseStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontSize + 0.5,
          ),
        ),
        TextSpan(
          text: '을 하셔야 원활하게 이용 하실 수 있습니다. 근로조건 설정에는 설문조사가 포함되어 있지만 ',
          style: baseStyle,
        ),
        TextSpan(
          text: '원치 않으시면 제외 가능',
          style: baseStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontSize + 0.5,
          ),
        ),
        TextSpan(
          text: '합니다. ',
          style: baseStyle,
        ),

      ],
    ),
    textScaler: TextScaler.noScaling,
  );
}
