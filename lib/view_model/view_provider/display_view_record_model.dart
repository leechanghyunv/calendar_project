import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/repository_import.dart';

part 'display_view_record_model.freezed.dart';
part 'display_view_record_model.g.dart';

@freezed
abstract class DisplayViewRecordModel with _$DisplayViewRecordModel {
  const factory DisplayViewRecordModel({
    @Default(1.0) double normal,
    @Default(1.5) double extended,
    @Default(2.0) double night,
    @Default(false) bool valueChange,
  }) = _DisplayViewRecordModel;

  factory DisplayViewRecordModel.fromJson(Map<String, dynamic> json) =>
      _$DisplayViewRecordModelFromJson(json);
}

extension DisplayViewRecordModelExt on DisplayViewRecordModel {

  List<Map<String, dynamic>> chipList(BuildContext context) => [
    {
      'value': Platform.isAndroid ? '$normal' : context.isDark ? '$normal' : '🚀$normal',
      'icon': 'rocket',
      'color': context.textColor, // 🎯 context 사용
    },
    {
      'value': Platform.isAndroid ? '$extended' : context.isDark ? '$extended' : '🔥$extended',
      'icon': 'cuboid',
      'color': context.textColor,
    },
    {
      'value': Platform.isAndroid ? '$night' : context.isDark ? '$night' : '🎉$night',
      'icon': 'zap',
      'color': context.textColor,
    },
  ];

}

@riverpod
class DisplayValue extends _$DisplayValue {

  @override
  FutureOr<DisplayViewRecordModel> build() async {
    final prefs = await SharedPreferences.getInstance();
    return DisplayViewRecordModel(
      normal: prefs.getDouble('normal') ?? 1.0,
      extended: prefs.getDouble('extended') ?? 1.5,
      night: prefs.getDouble('night') ?? 2.0,
      valueChange: prefs.getBool('valueChange') ?? false,
    );
  }

  Future<void> copyWithState(double normal, double extended, double night) async {
    final prefs = await SharedPreferences.getInstance();

    state = const AsyncValue.loading();

    await prefs.setDouble('normal', normal);
    await prefs.setDouble('extended', extended);
    await prefs.setDouble('night', night);

    final isDefault = normal == 1.0 && extended == 1.5 && night == 2.0;
    await prefs.setBool('valueChange', !isDefault);

    state = await AsyncValue.guard(() async {
      final current = await future; // 🎯 현재 값 추출
      return current.copyWith(
        normal: normal,
        extended: extended,
        night: night,
        valueChange: !isDefault,
      );
    });


  }


}