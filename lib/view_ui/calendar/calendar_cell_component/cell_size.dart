import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellSizes {
  final double appHeight;
  final double appWidth;
  final bool isFold;
  final double recordAmount;
  final bool isExpanded;

  CellSizes({
    required this.appHeight,
    required this.appWidth,
    this.isFold = false,
    this.recordAmount = 0.0,
    this.isExpanded = false,
  });

  double get calendarMargin {
    if (appHeight < 700) return appWidth < 350 ? 34.w : 27.5.w;
    if (appWidth <= 370) return isFold ? 41.25.w : 35.w;

    /// 갤럭시 폴드에서 40.w, 37.5가 적당함
    if (appWidth > 500) return isFold ? 18.5.w : 25.w;

    /// 원래값 47.5 갤럭시 폴드에서 32, 18.5.w가 적당함
    return Platform.isAndroid ? 37.w : 35.w;

    /// 안드 테스트폰으론 38.w 가 적당한 384
  }

  double get fontSizeNonMemo {
    if (appWidth < 376) return 11;
    if (recordAmount == 0.0) return 11.5;
    if (appWidth >= 410) return 14.5;
    return 13.0;
  }

  double get defaultSize {
    if (appWidth >= 450) return 20;
    if (appWidth >= 410) return 17;
    if (appWidth >= 390) return 15;
    if (appWidth >= 375) return 14;
    if (appWidth >= 350) return 12.5;
    if (appWidth >= 320) return 11.5;
    return 15;
  }

  double get markerWidth {
    if (isExpanded) {
      if (appHeight < 700) return 42.5.w;
      if (appWidth > 500) return 22.5.w;
      return 45.w;
    }

    if (appHeight < 700) return 37.5.w;
    if (appWidth > 500) return 22.5.w;
    return 40.w;
  }

  double get holidayMargin {
    if (appHeight < 700) return appWidth > 350 ? 29.w : 38.w;

    if (isExpanded) {
      if (appWidth <= 370) return 33.5.w;
      if (appWidth > 500) return 50.0;
      return 35.w;
    }

    if (appWidth <= 370) {
      return appWidth > 360 ? 36.5.w : 37.w;
    }

    if (appWidth > 500) {
      return isFold ? 35.0 : 50.0;
    }

    return 35.0.w;
  }


}
