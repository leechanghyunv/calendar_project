import 'package:freezed_annotation/freezed_annotation.dart';

part 'electric_job_stats.freezed.dart';

@freezed
abstract class ElectricJobStats with _$ElectricJobStats {
  const factory ElectricJobStats({
    @Default('') String site,
    @Default(0.0) double poselAverage,      // 전기-포설
    @Default(0.0) double trayAverage,       // 전기-트레이
    @Default(0.0) double innerLineTerminalAverage,  // 전기-내선,단말
    @Default(0.0) double etcAverage,        // 전기-기타

  }) = _ElectricJobStats;
}