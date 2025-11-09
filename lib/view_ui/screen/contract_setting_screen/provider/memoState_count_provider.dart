

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../repository/repository_import.dart';

part 'memoState_count_provider.g.dart';

@riverpod
class memoStateOpen extends _$memoStateOpen {
  static const String _key = 'app_open_count';
  static const int _maxCount = 3;

  @override
  FutureOr<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt(_key) ?? 0;

    // 카운트 증가
    final newCount = count + 1;
    await prefs.setInt(_key, newCount);

    // 3번 미만이면 true, 3번 이상이면 false
    return newCount < _maxCount;
  }
}
