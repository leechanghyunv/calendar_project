

import '../../../../core/export_package.dart';

class TextStyles {
  static TextStyle getCommonStyle({
    required double appWidth,
    FontWeight weight = FontWeight.bold,
    Color color = Colors.black,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontWeight: weight,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: Platform.isAndroid
          ? appWidth > 500 ? (12.5 - 1.0).sp/2 : (12.5 - 1.0).sp
          : appWidth > 500 ? 12.5.sp/2 : 12.5.sp,
      letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
    );
  }

  static TextSpan createSpan({
    required String text,
    required double appWidth,
    FontWeight weight = FontWeight.bold,
    Color? backgroundColor,
  }) {
    return TextSpan(
      text: text,
      style: getCommonStyle(
        appWidth: appWidth,
        weight: weight,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

Widget RichTextBox(double width) => RichText(
    text: TextSpan(
      children: [
        TextStyles.createSpan(
          text: '카카오톡,이메일 등 외부에 저장되어 있던 공수 기록을 붙여넣어주세요. 이후',
          appWidth: width,
        ),
        TextStyles.createSpan(
          text: ' 입력칸 좌측에 아이콘을 눌러 저장 ',
          appWidth: width,
          weight: FontWeight.w900,
          backgroundColor: Colors.blue.withOpacity(0.3),
        ),
        TextStyles.createSpan(
          text: '해주세요. 아래쪽에 ',
          appWidth: width,
        ),
        TextStyles.createSpan(
          text: '"백업은 어떻게?"',
          appWidth: width,
        ),
        TextStyles.createSpan(
          text: ' 참고하기',
          appWidth: width,
        ),
      ],
    ),
);