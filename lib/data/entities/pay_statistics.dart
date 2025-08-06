import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_statistics.freezed.dart';

@freezed
abstract class PayStatistics with _$PayStatistics {
  const factory PayStatistics({
    @Default(0.0) double average,
    @Default(0) int minimum,
    @Default(0) int maximum,
    @Default(0) int count,

    @Default(0.0) double electricAverage,  // 전기
    @Default(0.0) double pipeAverage,      // 배관
    @Default(0.0) double ductAverage,      // 덕트
    @Default(0.0) double scaffoldAverage,  // 비계 ⭐
    @Default(0.0) double partitionAverage, // 칸막이 ⭐
    @Default(0.0) double weldingAverage,   // 용접 🔥
    @Default(0.0) double facilityAverage,  // 설비 ⚙️

  }) = _PayStatistics;
}
