
import '../../core/export_package.dart';
import '../../theme_color.dart';

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



/// contract_textfield
TextStyle ContractFontStyle() => TextStyle(
    letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
    fontSize: Platform.isAndroid ? 14 : 15,
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
    fontSize: Platform.isAndroid ?  size-1 : size,
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
    height: textHeight,
    fontWeight: FontWeight.bold,
    color: color ?? Colors.black,  // color가 null이면 Colors.black 사용
    fontSize: Platform.isAndroid ?  size-1 : size,
    letterSpacing: letterSpacing ?? (Platform.isAndroid ? 0.5 : 0.0),
  ),
);



/// back_up_textfield
TextStyle BackupFontStyle(
    double size,

    {double? height,double? width}  // 옵셔널 height 파라미터 추가
    ) {

  if(width == null) {
    width = 0;
  }
  return TextStyle(
    letterSpacing: Platform.isAndroid ? 1.0 : 0.5,
    fontSize: width < 376 ? (size -1) : size,
    height: height,  // height가 null이면 자동으로 무시됨
  );
}

