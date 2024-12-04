import '../../core/export_package.dart';

class ContainerUtil {
  static final ContainerUtil _instance = ContainerUtil._internal();
  factory ContainerUtil() => _instance;
  ContainerUtil._internal();

  double height = 0;
  double width = 0;

  void init(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}

TextStyle TopRightTextStyle({double? letterSpacing}) => TextStyle(
  wordSpacing: -2.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: ContainerUtil().height < 700
      ? ContainerUtil().width > 500 ? 5.75.sp : 12.sp
      : ContainerUtil().width > 500 ? 6.sp : 11.5.sp,
  overflow: TextOverflow.ellipsis,
  letterSpacing: letterSpacing,  // null이면 자동으로 무시됨
);

TextStyle TopLeftTextStyle() => TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: ContainerUtil().height < 700
      ? ContainerUtil().width > 500 ? 6.5.sp : 14.sp
      : ContainerUtil().width > 500 ? 7.sp : 13.5.sp,
    letterSpacing: 0.75,
);

/// /// ///

FontWeight bottomWeight = Platform.isAndroid ? FontWeight.w800 : FontWeight.w900;

TextStyle BottomStyle({
  double? letterSpacing,
  FontWeight? fontWeight,
  Color? color,
}) => TextStyle(
  fontSize: ContainerUtil().height < 700

      ? ContainerUtil().width > 500
      ? 7.sp
      : (ContainerUtil().width <= 370
      ? 14.sp
      : 14.sp)

      : ContainerUtil().width > 500
      ? 7.sp
      : (ContainerUtil().width <= 370
      ? 13.5.sp
      : 14.sp),
  letterSpacing: letterSpacing,  // null이면 무시됨
  fontWeight: fontWeight,        // null이면 무시됨
  color: color,                  // null이면 무시됨
);

TextStyle BottomSubStyle({
  FontWeight? fontWeight,  // fontWeight만 옵셔널로 남김
}) => TextStyle(
  fontSize: ContainerUtil().height < 700

      ? ContainerUtil().width > 500
      ? 7.sp
      : (ContainerUtil().width <= 370
      ? 14.sp
      : 14.sp)

      : ContainerUtil().width > 500
      ? 7.sp
      : (ContainerUtil().width <= 370
      ? 13.5.sp
      : 15.sp),
  color: Colors.grey[900],  // 고정값
  letterSpacing: Platform.isAndroid ? 1.50 : 0.75,  // 고정값
  fontWeight: fontWeight,  // 옵셔널 유지
);



