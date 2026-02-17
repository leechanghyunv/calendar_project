import '../../../../repository/repository_import.dart';
import '../../../../repository/sharePreferences_init.dart';

part 'convert_memoChip_provider.g.dart';

@riverpod
class ConvertMemoChip extends _$ConvertMemoChip {
  static const String _key = 'memoChip_state';

  @override
  Future<bool> build() async {
    final prefs = await ref.prefsWatch;
    return prefs.getBool(_key) ?? false;
  }

 Future<void> convert() async {
   await update((current) => !current);

   final prefs = await ref.prefsRead;
   await prefs.setBool(_key, state.value!);
 }

}
