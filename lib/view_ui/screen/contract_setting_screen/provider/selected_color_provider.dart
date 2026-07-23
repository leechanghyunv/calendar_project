import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/export_package.dart';
import '../../../../repository/sharePreferences_init.dart';

part 'selected_color_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedColor extends _$SelectedColor {
  static const String _key = 'selected_color_value';

  @override
  Future<Color> build() async {
    final prefs = await ref.prefsWatch;
    final int? colorValue = prefs.getInt(_key);
    if (colorValue != null) {
      return Color(colorValue);
    }
    return Colors.grey.shade200;
  }

  Future<void> setColor(Color color) async {
    state = AsyncValue.data(color);
    final prefs = await ref.prefsRead;
    await prefs.setInt(_key, color.toARGB32());
  }
}
