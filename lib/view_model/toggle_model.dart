

import 'package:calendar_project_240727/repository/toggle_switch_value.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toggle_model.g.dart';


@riverpod
class ToggleModel extends _$ToggleModel {

  @override
  Future<bool> build() async => await _getToggleValue();

  Future<bool> _getToggleValue() async {
    final prefs = await ref.watch(toggleValueProvider.future);
    final value = await prefs.getToggleValue();
    return value;
  }

  Future<void> setToggleValue1() async {
    final prefs = await ref.watch(toggleValueProvider.future);
    prefs.setToggleValue1();
    state = const AsyncValue.data(true);
  }

  Future<void> setToggleValue2() async {
    final prefs = await ref.watch(toggleValueProvider.future);
    prefs.setToggleValue2();
    state = const AsyncValue.data(false);
  }


}




