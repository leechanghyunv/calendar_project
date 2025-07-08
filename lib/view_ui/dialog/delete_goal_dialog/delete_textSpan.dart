import '../../../../core/export_package.dart';

class TextStyles {
  static TextStyle getCommonStyle({
    required double appWidth,
    FontWeight weight = FontWeight.bold,
    Color color = Colors.black,
    Color? backgroundColor,
    TextDecoration? decoration,
    Color? decorationColor, // 👈 추가
    TextDecorationStyle? decorationStyle, // 👈 추가
  }) {
    return TextStyle(
      fontWeight: weight,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: appWidth < 376 ? 12.5 : (appWidth > 400 ? 13.5 : 13),
      letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
      decoration: decoration,
      decorationColor: decorationColor, // 👈 추가
      decorationStyle: decorationStyle, // 👈 추가
    );
  }

  static TextSpan createSpan({
    required String text,
    required double appWidth,
    FontWeight weight = FontWeight.bold,
    Color? backgroundColor,
    TextDecoration? decoration,
    Color? decorationColor, // 👈 추가
    TextDecorationStyle? decorationStyle, // 👈 추가
  }) {
    return TextSpan(
      text: text,
      style: getCommonStyle(
        appWidth: appWidth,
        weight: weight,
        backgroundColor: backgroundColor,
        decoration: decoration,
        decorationColor: decorationColor, // 👈 추가
        decorationStyle: decorationStyle, // 👈 추가
      ),
    );
  }
}

Widget DeleteRichTextBox(double width,String month) => RichText(
  textScaler: TextScaler.noScaling,
  text: TextSpan(
    children: [
      TextStyles.createSpan(
        text: '삭제창에서 기간설정을 따로 하지 않고 ',
        appWidth: width,
      ),
      TextStyles.createSpan(
        text: ' 삭제하기 ',
        appWidth: width,
        weight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
        backgroundColor: Colors.grey.withOpacity(0.3),
      ),
      TextStyles.createSpan(
        text: ' 를 누르시면 ',
        appWidth: width,
      ),
      TextStyles.createSpan(
        text: ' ${month}월 모두 삭제 ',
        appWidth: width,
        weight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
        backgroundColor: Colors.blue.withOpacity(0.3),
      ),
      TextStyles.createSpan(
        text: ' 처리됩니다.',
        appWidth: width,
      ),
    ],
  ),
);