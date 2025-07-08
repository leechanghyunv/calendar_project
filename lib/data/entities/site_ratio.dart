import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_ratio.freezed.dart';

@freezed
abstract class SiteRatio with _$SiteRatio {
  const factory SiteRatio({
    @Default('') String siteName,
    @Default(0) int count,
    @Default(0.0) double percentage,
  }) = _SiteRatio;
}

@freezed
abstract class JobRatio with _$JobRatio {
  const factory JobRatio({
    @Default('') String jobName,
    @Default(0.0) double percentage,
  }) = _JobRatio;
}