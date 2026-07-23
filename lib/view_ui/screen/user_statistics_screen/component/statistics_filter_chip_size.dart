
import 'dart:io';

class FilterChipSizes {

  final double width;
  final double height;

  FilterChipSizes({
    required this.width,
    required this.height,
});

  double get chipHeight{
    if (height <= 750) return height < 350 ? 21.5 : 24;
    if (height <= 350)  return 22.0; // 원하는 값
    if (height <= 400)  return 24.0; // 원하는 값
    return height > 410 ? 26.5 : 25;
  }


  double get HorizontalPadding{
    if (width <= 330) return 3.5; // 원하는 값
    if (width <= 350) return 4.0; // 원하는 값
    if (width <= 375) return 6.0;
    if (width <= 420) return Platform.isAndroid? 6.0 : 7.5;
    return 12.0;

  }
}