
class DefaultSizes {
  final double width;

  DefaultSizes(this.width);

  double get gap => switch (width) {
    >= 400 => 35,
    >= 390 => 25,
    >= 375 => 23,
    _ => 22,
  };

  double get containerSize => switch (width) {
    >= 400 => 150,
    >= 390 => 100,
    >= 375 => 90,
    _ => 80,
  };

  double get payChipSize => switch (width) {
    >= 390 => 30,
    >= 375 => 28,
    _ => 26,
  };

  double get Icon => switch (width) {
    >= 450 => 27,
    >= 400 => 25,
    >= 390 => 23.5,
    >= 375 => 22.5,
    _ => 18.5,
  };

}