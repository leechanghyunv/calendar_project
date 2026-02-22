import 'package:calendar_project_240727/model/version_introduce_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../repository/repository_import.dart';


part 'firebase_remote_config_model.g.dart';


@riverpod
class Version extends _$Version {
  late FirebaseRemoteConfig _remoteConfig;

  String versionInfo = Platform.isAndroid ? '1.7.1' : '1.6.5';

  String get version => state.value?.version ?? versionInfo;

  @override
  Future<VersionInfo> build() async {
    _remoteConfig = FirebaseRemoteConfig.instance;
    return _fetchVersion();
  }


  Future<VersionInfo> _fetchVersion() async {
    try{
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));

      await _remoteConfig.fetchAndActivate();
      final jsonString = _remoteConfig.getString('Version');

      if (jsonString.isEmpty) {
        return VersionInfo();
      }

      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      return VersionInfo.fromJson(jsonData);

    }catch(e){
      print('Remote Config 초기화 오류: $e');
      return VersionInfo();
    }
  }

  // 수동으로 Remote Config 새로고침
  Future<void> refreshConfig() async {
    state = const AsyncValue.loading();

    try {
      // 캐시 만료 설정 (강제 새로고침)
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: Duration.zero,
      ));

      // 새로운 값 가져오기 및 활성화
      await _remoteConfig.fetchAndActivate();

      // 값 업데이트
      final result = await _fetchVersion();
      state = AsyncValue.data(result);
    } catch (e) {
      print('Remote Config 새로고침 오류: $e');
      state = AsyncError(e, StackTrace.current);
    }
  }

}
