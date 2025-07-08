import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_statistics.freezed.dart';

@freezed
abstract class PayStatistics with _$PayStatistics {
  const factory PayStatistics({
    @Default(0.0) double average,
    @Default(0) int minimum,
    @Default(0) int maximum,
    @Default(0) int count,
  }) = _PayStatistics;
}
