import '../dark_light/dark_light.dart';
import '../export_package.dart';

double? get textHeight => Platform.isAndroid ? 1.2 : null;

extension ThemeColorExtension on BuildContext {

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => Theme.of(this).brightness == Brightness.light;

  Color get buttonColor => isDark
      ? Colors.tealAccent
      : Colors.grey.shade100;

  Color get disPlayColor => isDark
      ? Colors.tealAccent
      : Colors.grey.shade700;

  Color get disPlayBigColor => isDark
      ? Colors.tealAccent
      : Colors.grey.shade900;

  Color get boxColor => isDark
      ? Colors.black54
      : Colors.white;

  Color get toggleOnColor => isDark
      ? Colors.teal.shade700
      : Colors.teal.shade300;


  Color get toggleTrackOnColor => isDark
      ? Colors.teal.shade300
      : Colors.teal.shade100;


  Color get chipColor => isDark
      ? Colors.black54
      : Colors.grey.shade200;

  Color get bTypeChipColor => isDark
      ? Colors.black54
      : Colors.grey.shade100;

  Color get chipTextColor => isDark
      ? Colors.grey.shade200
      : Colors.grey.shade900;

  Color get dialogColor => isDark
      ? Colors.black87
      : Colors.grey.shade50;

  Color get saturdayColor => isLight ? Colors.blue : Colors.tealAccent; // 토요일;
  Color get sundayColor => isLight ? Colors.teal : Colors.tealAccent; // 일요일


  /// /// /// /// /// /// /// /// /// /// /// ///

  Color get idChipColor => isDark
      ? Colors.black54
      : Colors.teal.shade100;

  Color get rangeChipColor => isDark
      ? Colors.black54
      : Colors.teal.shade50;

  Color get idChipTextColor => isDark
      ? Colors.tealAccent
      : Colors.teal.shade700;

  Color get idChipBorderColor => isDark
      ? Colors.tealAccent
      : Colors.teal.shade500;

  /// /// /// /// /// /// /// /// /// /// /// ///

  Color get selectedChipColor => isDark
      ? Colors.black54
      : Colors.grey.shade300;

  Color get underBoxColor => isDark
      ? Colors.black
      : Colors.white;

  Color get textColor => isDark
      ? LightDarkMode.darkTextMain
      : LightDarkMode.lightTextMain;

  Color get subTextColor => isDark
      ? LightDarkMode.darkTextSmall
      : LightDarkMode.lightTextSmall;

  Color get borderColor => isDark
      ? LightDarkMode.darkBorder
      : LightDarkMode.lightBorder;
}