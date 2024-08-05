import 'package:freezed_annotation/freezed_annotation.dart';

part 'filted_model.freezed.dart';
part 'filted_model.g.dart';

@freezed
class FiltedModel with _$FiltedModel {
  const factory FiltedModel({
    @Default(0) int workDay, /// length 1일
    @Default(0) int workDaynMonth,
    @Default(0) int totalPay, /// normalPay + extendedPay + nightPay
    @Default(0) int totalPaynMonth,
    @Default(0.0) double workRecode,   /// 1.0공수, 1.5연장
    @Default(0.0) double workRecodenMonth,
    @Default(0.0) double normalPay, /// 150000
    @Default(0.0) double extendPay, /// 225000
    @Default(0.0) double nightPay, /// 300000

    @Default(0) int normalDay,
    @Default(0) int extendDay,
    @Default(0) int nightDay,

    @Default(0.0) double goalRate, /// (totalPay / goal(history)) * 100
    @Default(0.0) double afterTaxTotal, /// totalPay / tax
    @Default(0.0) double afterTaxMonth, /// totalPay / tax

    @Default(0.0) double normalPercent,  /// normalPay*length / workDaynMonth
    @Default(0.0) double extendPercent,  /// extendedPay*length / workDaynMonth
    @Default(0.0) double nightPercent,  /// nightPay*length / workDaynMonth
  }) = _FiltedModel;

  factory FiltedModel.fromJson(Map<String, dynamic> json) =>
      _$FiltedModelFromJson(json);
}