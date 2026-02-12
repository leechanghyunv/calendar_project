
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/extentions/theme_extension.dart';

Widget introText(double height) {
  final fontSize = height.responsiveSize([16,15,15,15,13.5,13]);
  final baseStyle = TextStyle(
    height: Platform.isAndroid ? 1.5 : null,
    fontSize: fontSize,
  );
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: '이용해주셔서 감사합니다. 워크캘린더는 ',
          style: baseStyle,
        ),

        TextSpan(
          text: '근로조건을 설정하셔야 공수등록',
          style: baseStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' 을 하실 수 있습니다. 근로조건 설정,수정은 ',
          style: baseStyle,
        ),
        TextSpan(
          text: "'메인화면'에서도 가능 합니다",
          style: baseStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    textScaler: TextScaler.noScaling,
  );
}


Widget smallText(BuildContext context,String text, double height) => Text(
  text,
  textScaler: TextScaler.noScaling,
  style: TextStyle(
    height: textHeight,
    fontSize: height >= 850
        ? 12.0
        : height > 750
        ? 11.0
        : 10.5,
    color: context.subTextColor,
  ),
);



