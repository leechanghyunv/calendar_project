import 'package:freezed_annotation/freezed_annotation.dart';

part 'column_box_value_model.freezed.dart';
part 'column_box_value_model.g.dart';


@freezed
abstract class ColumnBoxValueModel with _$ColumnBoxValueModel {
  const factory ColumnBoxValueModel({
    @Default(0) int workDayValue,
    @Default(0) int extraDay,
    @Default(0) int wrd,
    @Default('퇴직공제금은 0만원, 신청자격일수 252일 중 0% 달성') String text1,
    @Default('근로일수는 0일, 실업급여 조건 0% 달성') String text2,
    @Default(0) double percentage,
    @Default(0.0) double wrdProgress,
    @Default(0.0) double workDayProgress,
  }) = _ColumnBoxValueModel;


  factory ColumnBoxValueModel.fromJson(Map<String, dynamic> json) =>
      _$ColumnBoxValueModelFromJson(json);
}

