
class MainBoxSizes {
  final double width;
  final bool isFold;

  MainBoxSizes({
    required this.width,
    this.isFold = false,
});

  double get bigFontSize {
    if (width >= 450) return isFold ? 37 : 40.5;
    if (width >= 420) return 40;
    if (width >= 400) return 38;
    if (width >= 390) return 32;
    if (width >= 375) return 31;
    return 27;
  }

  double get subFontSize {
    if (width >= 450) return isFold ? 12 : 12.5;
    if (width >= 400) return 12;
    if (width >= 390) return 10;
    if (width >= 376) return 9.25;
    return 8;
  }

  double get gap => switch (width) {
    >= 400 => 35,
    >= 390 => 25,
    >= 375 => 23,
    _ => 22,
  };

  double get verticalPadding {
    return isFold && width > 500 ? 12.0 : width < 350 ? 8.0 : 14.0;
  }

  double get contentPadding => switch (width) {
    >= 450 => isFold ? 16 : 22.5,
    >= 390 => 16,
    >= 370 => 14,
    _ => 10,
  };

  // double get chartBoxHeight => switch(width) {
  //   >= 400 => isFold ? 155 : 170,
  //   >= 390 => 155,
  //   >= 375 => 135,
  //   _ => 135,
  // };


  double get boxHeight => switch(width) {
    > 400 => isFold ? 72.5 : 80.0,
    < 376 => 65.0,
    _ => 72.5,
  };

  double get chartBoxHeight => boxHeight * 2 + (width < 380 ? 5 : 10);

  double get moreVertIcon => switch (width) {
    >= 420 => 25.5,
    >= 400 => 25.5,
    >= 390 => 25.5,
    >= 375 => 24,
    _ => 20,
  };

  double get arrowIcon => switch (width) {
    >= 420 => 37,
    >= 400 => 37,
    >= 390 => 32,
    >= 375 => 30,
    _ => 26,
  };

  double get buttonSideIcon => switch (width) {
    >= 450 => 27,
    >= 400 => 24,
    >= 390 => 24,
    >= 375 => 24,
    _ => 20,
  };


  double get indicatorFont => switch (width){
    >= 400 => 10,
    >= 390 => 9.5,
    >= 375 => 8.0,
    _ => 7.0
  };




}