import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'toggle_switch_value.g.dart';


@riverpod
Future<ToggleValueMaanger> toggleValue(ToggleValueRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  return ToggleValueMaanger(prefs);
}

class ToggleValueMaanger {

  final SharedPreferences prefs;

  ToggleValueMaanger(this.prefs);

  Future<bool> getToggleValue() async {
    return prefs.getBool('toggleValue') ?? false;
  }

 Future<bool> setToggleValue1() async {
    return prefs.setBool('toggleValue', true);
 }

  Future<bool> setToggleValue2() async {
    return prefs.setBool('toggleValue', false);
  }

}
