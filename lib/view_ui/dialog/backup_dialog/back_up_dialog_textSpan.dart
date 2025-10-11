import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';

class BackUpDialogTextSpan extends StatelessWidget {

  const BackUpDialogTextSpan({super.key});

  @override
  Widget build(BuildContext context) {
    final appWidth = context.width;
    final isDark = context.isDark;
    return RichTextBox(appWidth,isDark);
  }
}


class TextStyles {
  static TextStyle getCommonStyle({
    required double appWidth,
    required bool isDark,
    FontWeight weight = FontWeight.bold,
    Color color = Colors.black,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontWeight: weight,
      color: isDark ? Colors.white : Colors.black,
      backgroundColor: backgroundColor,
      fontSize: appWidth < 376 ? 11.5 :  (appWidth > 400 ? 13.5 : 12.5),
      letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
    );
  }

  static TextSpan createSpan({
    required String text,
    required double appWidth,
    required bool isDark,
    FontWeight weight = FontWeight.bold,
    Color? backgroundColor,
  }) {
    return TextSpan(
      text: text,
      style: getCommonStyle(
        appWidth: appWidth,
        weight: weight,
        backgroundColor: backgroundColor,
        isDark: isDark,
      ),
    );
  }
}

Widget RichTextBox(double width, bool isDark) => RichText(
  textScaler: TextScaler.noScaling,
    text: TextSpan(
      children: [
        TextStyles.createSpan(
          text: '카카오톡,이메일 등 외부에 저장되어 있던 공수 기록을 붙여넣어주세요. 이후',
          appWidth: width,  isDark: isDark,
        ),
        TextStyles.createSpan(
          text: ' 입력칸 좌측에 아이콘을 눌러 저장 ',
          appWidth: width,
          isDark: isDark,
          weight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
          backgroundColor: isDark
              ? Colors.tealAccent.withOpacity(0.3)
              : Colors.teal.withOpacity(0.3),
        ),
        TextStyles.createSpan(
          text: '해주세요.',
          appWidth: width,
          isDark: isDark,
        ),
      ],
    ),
);