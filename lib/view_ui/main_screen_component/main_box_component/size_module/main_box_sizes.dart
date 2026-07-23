

class MainBoxSizes {
  final double width;
  final bool isFold;
  final bool isFlip;

  MainBoxSizes({
    required this.width,
    this.isFold = false,
    this.isFlip = false,

});

  double get bigFontSize {
    if (width >= 450) return isFold ? 30.5 : 42.5;
    if (width >= 420) return 40;
    if (width >= 410) return 38;
    if (width >= 390) return 32;
    if (width >= 375) return 30.5;
    if (width >= 350) return 28.5;
    return 27;
  }

  double get subFontSize {
    if (width >= 450) return isFold ? 10.5 : 12.5;
    if (width >= 410) return 12.5;
    if (width >= 390) return 10.5;
    if (width >= 376) return 9.75;
    if (width >= 350) return 9.25;
    return 8.5;
  }

  double get gap => switch (width) {
    >= 410 => isFold ? 25 : 26.5, /// 26.5
    >= 390 => 25,
    >= 375 => 23,
    >= 350 => 22,
    _ => 21,
  };

  double get boxHeight => switch(width) {
    > 410 => isFold ? 55.0 : 75.0, /// 75
    < 350 => 60.0,
    < 376 => 65.0,
  /// _란 (376≤width≤410)
    _ => 72.5,
  };




  double get chartBoxHeight => boxHeight * 2 + (width < 380 ? 5 : 10);

  double get verticalPadding {
    return isFold && width > 500 ? 12.0 : width < 350 ? 8.0 : 12.0;
  }

  double get contentPadding => switch (width) {
    >= 450 => isFold ? 16 : 22.5,
    >= 390 => 16,
    >= 370 => 14,
    _ => 10,
  };


  double get moreVertIcon => switch (width) {
    >= 420 => 25.5,
    >= 410 => 25.5,
    >= 390 => 25.5,
    >= 375 => 24,
    >= 350 => 22,
    _ => 18,
  };

  double get arrowIcon => switch (width) {
    >= 420 => isFold ? 30.0 : 37,
    >= 410 => 34,
    >= 390 => 32,
    >= 375 => 30,
    >= 350 => 28,
    _ => 26,
  };

  double get buttonSideIcon => switch (width) {
    >= 450 => isFold ? 24 : 27,
    >= 410 => 24,
    >= 390 => 24,
    >= 375 => 24,
    _ => 22,
  };


  double get indicatorFont => (switch (width) {
    >= 400 => isFold ? 7.0 : 9.5,
    >= 390 => 9.5,
    >= 375 => 8.0,
    >= 350 => isFlip ? 7.5 : 7.0,
    _ => 6.75
  }) ;







}