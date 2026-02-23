import '../../../../core/export_package.dart';

enum BackupScreenType {
  default_,
  export,
  import;

  String get guideText => switch (this) {
    BackupScreenType.default_ => '복사 후 카카오톡,이메일 등 외부 보관 후 새 기기에 붙여넣기',
    BackupScreenType.export   => '압축된 기록은 카카오톡,이메일 등 외부에 보관해주세요',
    BackupScreenType.import   => '근로조건을 저장한 후에 공수 기록이 달력에 반영됩니다',
  };

}

final backupScreenTypeProvider = StateProvider<BackupScreenType>(
      (ref) => BackupScreenType.default_,
);