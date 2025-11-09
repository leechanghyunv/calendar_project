
import 'package:calendar_project_240727/repository/sharePreferences_init.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../repository/repository_import.dart';

part 'version_manager.g.dart';

@riverpod
class VersionManager extends _$VersionManager {
  static const String _lastShownVersionKey = '1.5.8';

  @override
  FutureOr<String?> build() async {
    final prefs = await ref.prefsWatch;
    return prefs.getString(_lastShownVersionKey);

  }

  Future<String> getCurrentVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<bool> shouldShowDialog() async {
    /// future는 build() 메서드의 결과를 가져오는 Riverpod의 기능이다.
    final lastShown = await future;
    final currentVersion = await getCurrentVersion();
    return lastShown != currentVersion;
  }

  Future<void> markVersionAsShown() async {
    final prefs = await ref.prefsRead;
    final currentVersion = await getCurrentVersion();
    await prefs.setString(_lastShownVersionKey, currentVersion);
    ref.invalidateSelf();
  }


}
