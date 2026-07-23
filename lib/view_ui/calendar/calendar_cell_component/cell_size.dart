import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellSizes {
  final double appHeight;
  final double appWidth;
  final bool isFold;
  final bool isFlip;
  final double recordAmount;


  CellSizes({
    required this.appHeight,
    required this.appWidth,
    this.isFold = false,
    this.isFlip = false,
    this.recordAmount = 0.0,

  });


  bool get isWideRatio {
    final ratio = appHeight / appWidth;
    return ratio >= 1 && ratio <= 1.5;
  }

  bool get narrowRatio {
    final ratio = appHeight / appWidth;
    return ratio >= 1 && ratio <= 1.5;
  }

  double get calendarMargin {

    final bool isNarrow = appWidth <= 350;
    final bool isMedium = appWidth <= 370;
    final bool isWide   = appWidth > 500;
    final bool isShort  = appHeight < 700;

    if (isShort)  return isNarrow ? 34.w : isWideRatio ? 18.5.w : 27.5.w;
    if (isMedium) return isFold ? 50.w : (isNarrow ? 42.w : 45.w);
    if (isWide)   return isWideRatio  ? 19.0.w  : 25.w;


    /// 원래값 47.5 갤럭시 폴드에서 32, 18.5.w가 적당함
    return Platform.isAndroid ? 42.5.w.clamp(0, 45) : 35.w;

    /// 안드 테스트폰으론 38.w 가 적당한 384
  }

  double get fontSizeNonMemo {
    if (appWidth < 376) return 11;
    if (recordAmount == 0.0) return 11.5;
    if (appWidth >= 410) return isWideRatio ? 11.5 : 14.5;
    return 13.0;
  }

  double get holidayFont {
    if (appWidth <= 330) return 7.0; // 원하는 값
    return isFlip ? 7.0 : 7.5;
  }

  double get defaultSize {
    if (appWidth >= 450) return isWideRatio ? 15 : 17;
    if (appWidth >= 410) return 17;
    if (appWidth >= 400) return 16;
    if (appWidth >= 390) return 15;
    if (appWidth >= 375) return 14;

    if (appWidth >= 350) return 13.5;
    if (appWidth >= 320) return isFold || isFlip ? 14: 11.5;
    return 15;
  }

  double get markerWidth {
    if (appHeight < 700) return 37.5.w.clamp(0, 40);
    if (appWidth > 500) return 23.5.w.clamp(0, 40);
    return 40.w;
  }

  double get holidayMargin {
    if (appHeight < 700) return appWidth > 350 ? 29.w : 38.w;

    if (appWidth <= 370) {
      return appWidth > 360 ? 36.5.w : isFold ? 47.w : isFlip ? 47.w : 37.w;
    }

    if (appWidth > 500) {
      return isFold ? 35.0 : 50.0;
    }

    return Platform.isAndroid? 40.0.w : 35.0.w;
  }


}
