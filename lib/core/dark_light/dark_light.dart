import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/repository_import.dart';

part 'dark_light.g.dart';

@riverpod
class LightDarkMode extends _$LightDarkMode {

  ThemeData lightMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    // scaffoldBackgroundColor: Colors.grey[100], // 라이트 모드 배경
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.black87),     // 본문 텍스트
    //   headlineMedium: TextStyle(color: Colors.black),  // 제목 텍스트
    // ),
  );

  ThemeData darkMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    // scaffoldBackgroundColor: Colors.grey[800], // 다크 모드 배경
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.white70),     // 본문 텍스트
    //   headlineMedium: TextStyle(color: Colors.white),  // 제목 텍스트
    // ),
  );

  static const String _themeKey = 'theme_preference';

  @override
  ThemeMode build() {
    _loadThemePreference();
    return ThemeMode.system;
  }


  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey);
    if (themeIndex != null) {
      state = ThemeMode.values[themeIndex];
    }
  }

  Future<void> toggle() async {
    final prefs = await SharedPreferences.getInstance();
    state = (state == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    await prefs.setInt(_themeKey, state.index);
  }

}
