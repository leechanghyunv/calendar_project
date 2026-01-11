import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import '../extentions/theme_color.dart';

Widget TextWidget(
    String msg, double size, double appWidth, {Color? color,FontWeight? fontWeight}) => Text(
  msg,
  textScaler: TextScaler.noScaling,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(
    fontWeight: fontWeight ?? FontWeight.bold,
    height: textHeight,
    color: color ?? Colors.black, // 기본값은 검정색
    fontSize: _getFontSize(size, appWidth),
    letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
  ),
);

double _getFontSize(double baseSize, double appWidth) {
  return switch (appWidth) {
    > 450 => baseSize + 2.5, // 매우 큰 화면 (초대형 안드로이드 등)
    > 420 => baseSize + 2.0, // 아이폰 Pro Max 등 대화면
    > 400 => baseSize + 1.5, // 일반적인 대형 화면
    <= 376 => baseSize - 1.0, // 작은 화면 (디스플레이 확대 모드 활성화 포함)
    _ => baseSize,            // 기본값
  };
}

Widget ErrorText(String msg, double appWidth, {Color? color}) {
  FontWeight fontWeight = msg.contains('목표금액은') ? FontWeight.w900 : FontWeight.bold;

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '$msg',
        textScaler: TextScaler.noScaling,
        style: TextStyle(
          fontWeight: fontWeight,
          height: textHeight,
          color: color ?? Colors.grey[700],  // color가 null이면 기본값 Colors.blue[700] 사용
          fontSize: (appWidth >= 450 ? 12.0 : appWidth > 400 ? 11 : (appWidth > 370 ? 10 : 9.5)),
        ),
      ),
    ],
  );
}


Widget dayText(String day) {
  return Consumer(builder: (context,ref,_){
      final isLight = Theme.of(context).brightness == Brightness.light;
      return  Text(day,
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            height: textHeight,
            fontSize: switch (context.width) {
              > 420 => 19,
              > 400 => 18,
              _ => 16,
            },
            color: day == '토'
                ? isLight ? Colors.blue :  Colors.tealAccent
                : day == '일'
                ? isLight ? Colors.teal : Colors.tealAccent
                : isLight ? Colors.black : Colors.white,
            fontWeight: FontWeight.w800,
          )
      );
    },

  );
}
