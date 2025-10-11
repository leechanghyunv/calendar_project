import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/repository_import.dart';

part 'dark_light.g.dart';



@riverpod
class LightDarkMode extends _$LightDarkMode {

  static const String _themeKey = 'theme_preference';

  ThemeData lightMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[50], // 라이트 모드 배경
  );

  ThemeData darkMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black, // 다크 모드 배경
  );

  // 🎨 라이트 모드 색상
  static Color lightTextMain = Colors.black87;
  static Color lightTextSmall = Colors.grey.shade600;
  static Color lightBorder = Color(0xFFE0E0E0);
  // 🌙 다크 모드 색상
  static Color darkTextMain = Colors.grey.shade100;
  static Color darkTextSmall = Colors.grey.shade200;
  static Color darkBorder = Color(0xFF424242);

  bool get isLight => state == ThemeMode.light;




  @override
  ThemeMode build() {
    _loadThemePreference();
    return ThemeMode.system;
  }

  // 🔹 시스템 테마가 다크모드인지 확인
  bool get isSystemDark {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }

  // 🔹 현재 실제로 적용될 테마 (system 고려)
  ThemeData get currentTheme {
    if (state == ThemeMode.system) {
      return isSystemDark ? darkMode : lightMode;
    }
    return state == ThemeMode.dark ? darkMode : lightMode;
  }


  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey);
    if (themeIndex != null) {
      state = ThemeMode.values[themeIndex];
    }
  }

  // 🔹 특정 테마로 설정
  Future<void> setTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    state = mode;
    await prefs.setInt(_themeKey, mode.index);
  }

}
