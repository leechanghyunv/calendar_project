import '../../../../core/export_package.dart';

enum BackupScreenType {
  default_,
  export,
  import;
}

final backupScreenTypeProvider = StateProvider<BackupScreenType>(
      (ref) => BackupScreenType.default_,
);