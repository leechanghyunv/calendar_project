import 'package:device_info_plus/device_info_plus.dart';

import '../../repository/repository_import.dart';

part 'is_galaxy_fold.g.dart';

@riverpod
Future<bool> isGalaxyFold(ref) async {
  if (!Platform.isAndroid) {
    return false;
  }

  final deviceInfo = DeviceInfoPlugin();
  final androidInfo = await deviceInfo.androidInfo;
  final model = androidInfo.model.toUpperCase();
  return model.startsWith('SM-F9'); // Fold 시리즈 여부 판단
}
