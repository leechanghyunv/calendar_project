
import '../../core/export_package.dart';

class ScreenUtil {
  static final ScreenUtil _instance = ScreenUtil._internal();
  factory ScreenUtil() => _instance;
  ScreenUtil._internal();

  double height = 0;
  double width = 0;

  void init(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}

double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;
/// decimal_dialog
TextStyle DecimalFontStyle(double size) => TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  fontSize: adaptiveSize(size),
);
/// decimal_textfield
TextStyle DecimalTextFieldHintStyle() => TextStyle(
  fontSize: adaptiveSize(ScreenUtil().width > 370 ? 13.5 : 12),
  letterSpacing: 0.5,
);
/// contract_textfield
TextStyle ContractFontStyle() => TextStyle(
    letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
    fontSize: ScreenUtil().width > 500 ? adaptiveSize(7.5) : adaptiveSize(15),
);
/// dialog_button
Widget ButtonTextWidget(
    String msg,
    double size,
    {Color? color}  // 옵셔널 color 파라미터 추가
    ) => Text(
  msg,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: color ?? Colors.black,  // color가 null이면 Colors.black 사용
    /// android 일때
    fontSize: Platform.isAndroid
        ? ScreenUtil().width > 500
        ? (size - 1.0).sp/2.1
        : (ScreenUtil().width <= 370
        ? (size - 2.0).sp
        : (size - 1.0).sp)
    /// ios 일때
        : size.sp,
    letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
  ),
);

Widget DialogTextWidget(
    String msg,
    double size,
    {Color? color,  // 옵셔널 color 파라미터
      double? letterSpacing}  // 옵셔널 letterSpacing 파라미터 추가
    ) => Text(
  msg,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: color ?? Colors.black,  // color가 null이면 Colors.black 사용
    fontSize: Platform.isAndroid
    /// android 일때
        ? ScreenUtil().width > 500
        ? (size - 1.0).sp/2.1
        : (ScreenUtil().width <= 370
        ? (size - 2.0).sp
        : (size - 1.0).sp)
    /// ios 일때
        : size.sp,
    // letterSpacing이 null이면 기본값(Platform.isAndroid ? 0.5 : 0.0) 사용
    letterSpacing: letterSpacing ?? (Platform.isAndroid ? 0.5 : 0.0),
  ),
);

/// enroll_button
Widget EnrollTextWidget(
    String msg,
    double size,
    {Color? color,  // 옵셔널 color 파라미터
      double? letterSpacing}  // 옵셔널 letterSpacing 파라미터 추가
    ) => Text(
  msg,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: color ?? Colors.black,  // color가 null이면 Colors.black 사용
    fontSize: Platform.isAndroid
    /// android 일때
        ? ScreenUtil().width > 500
        ? (size - 1.0).sp/2.1
        : (size - 1.0).sp
    /// ios 일때
        : size.sp,
    // letterSpacing이 null이면 기본값(Platform.isAndroid ? 0.5 : 0.0) 사용
    letterSpacing: letterSpacing ?? (Platform.isAndroid ? 0.5 : 0.0),
  ),
);
/// enroll_button
Widget PaddedEnrollText({
  required String text,
  double fontSize = 15,
  EdgeInsetsGeometry padding = const EdgeInsets.all(4.0),  // 기본값 4.0
}) => Padding(
  padding: padding,
  child: EnrollTextWidget(text, fontSize),
);


Widget dropDownText(String msg) => Text(msg,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
  ),
);
/// back_up_textfield
TextStyle BackupFontStyle(
    double size,
    {double? height}  // 옵셔널 height 파라미터 추가
    ) => TextStyle(
  letterSpacing: Platform.isAndroid ? 1.0 : 0.5,
  fontSize: ScreenUtil().width > 500 ? adaptiveSize(size) : adaptiveSize(size),
  height: height,  // height가 null이면 자동으로 무시됨
);

///daily_subsidy_dialog
TextStyle adpativeStyle = TextStyle(
    color: Colors.black,fontSize: adaptiveSize(13.5),
    fontWeight: FontWeight.w900,letterSpacing: 1.0);