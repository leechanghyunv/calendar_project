
class HeaderSizes {
  final double width;

  HeaderSizes(this.width);

  // 🎨 아이콘 사이즈
  double get ArrowIcon => switch (width) {
    >= 420 => 24,
    >= 400 => 24,
    >= 390 => 24,
    >= 375 => 24,

    _ => 20,
  };

  double get calendarIcon => switch (width) {
    >= 450 => 27,
    >= 400 => 25,
    >= 390 => 22.5,
    >= 375 => 22.5,

    _ => 17.5,
  };

  double get settingIcon => switch (width) {
    >= 450 => 27,
    >= 400 => 25,
    >= 390 => 25,
    >= 375 => 24,
    _ => 20,
  };

  /// 필터아이콘 사이즈
  double get filterIcon => switch (width) {
    >= 400 => 22.5,
    >= 390 => 20,
    >= 375 => 18,
    _ => 16,
  };


  // double get todayButton => 16.0;
  // double get filterText => 13.5;
  //
  // // 📏 간격
  // double get spacing => width > 400 ? 5 : 0;
  double get mainSpacing => width <= 375 ? 7.5 : 10.0;
  // double get settingSpacing => width > 400 ? 15 : 10;
}