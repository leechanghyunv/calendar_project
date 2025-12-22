
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';

Widget HistoryTextWidget(
    String msg, double size, double appWidth, {Color? color,FontWeight? fontWeight}) => Text(
  msg,
  textScaler: TextScaler.noScaling,
  style: TextStyle(
    fontWeight: fontWeight ?? FontWeight.bold,
    height: textHeight,
    color: color ?? Colors.black, // 기본값은 검정색
    fontSize: appWidth <= 376 ? (size - 1.0) : (appWidth > 400 ? (size + 1.5) : size),
    letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
  ),
);