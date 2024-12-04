import 'package:calendar_project_240727/core/export_package.dart';
import '../../core/utils/holidays.dart';

BoxDecoration selectedDeco(DateTime selected){

  return BoxDecoration(
      color:selectedColor(selected),
      shape: BoxShape.circle,
  );
}

Color selectedColor(DateTime selected) {
  // 크리스마스인지 확인 (월이 12이고 일이 25일)
  bool isChristmas = selected.month == 12 && selected.day == 25;
  bool newYear = selected.month == 1 && selected.day == 1;

  if (isChristmas) {
    return Colors.red.shade700;
  }

  if (newYear) {
    return Colors.amber.shade600;
  }

  return holidays.keys.any((key) =>
  key.year == selected.year &&
      key.month == selected.month &&
      key.day == selected.day)
      ? Colors.red.shade500
      : Colors.blueGrey.shade600;
}

Color selectedTextColor(DateTime selected){

  // 크리스마스인지 확인 (월이 12이고 일이 25일)
  bool isChristmas = selected.month == 12 && selected.day == 25;

  if (isChristmas) {
    return Colors.teal.shade700;
  }


  return holidays.keys.any((key) =>
  key.year == selected.year &&
      key.month == selected.month &&
      key.day == selected.day)
      ? Colors.black
      : Color(0xFFFAFAFA);


}