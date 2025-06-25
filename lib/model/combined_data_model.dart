import 'package:calendar_project_240727/model/work_history_model.dart';
import 'contract_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'combined_data_model.freezed.dart';
part 'combined_data_model.g.dart';

@freezed
abstract class LaborStatsModel with _$LaborStatsModel {
  const factory LaborStatsModel({
    @Default(0) int subsidyWorkDay,
    @Default(0) int totalSubsidy,
    @Default(0) int workDay,
    @Default('0만원') String totalPay,
    @Default('0만원') String totalPayAnd,
    @Default(0.0) double workRecord,
    @Default(0.0) double normalValue,
    @Default(0) int normalDay,
    @Default(0.0) double extendValue,
    @Default(0) int extendDay,
    @Default(0.0) double nightValue,
    @Default(0) int nightDay,
    @Default(0.0) double extraValue,
    @Default(0) int extraDay,
    @Default(0) int offDay,

    @Default('0%') String goalRate,
    @Default('0%') String goalRateAnd, /// 일비 추가 이후의 목표 달성률 세전
    @Default('0%') String goalRateAfterTax,
    @Default('0%') String goalRateAndAfterTax, /// 일비 추가 이후의 목표 달성률 세후,

    @Default('0만원') String afterTaxTotal,
    @Default('0만원') String remainingAfterTax,
    @Default('0공수') String remainingGoalAfterTax,

  }) = _LaborStatsModel;

  factory LaborStatsModel.fromJson(Map<String, dynamic> json) =>
      _$LaborStatsModelFromJson(json);
}


@freezed
abstract class LaborFiltedModel with _$LaborFiltedModel {
  const factory LaborFiltedModel({
    @Default(0) int subsidyDay,
    @Default('0만원') String totalSubsidy,

    @Default(0) int workDay,
    @Default(0) int totalPay,
    @Default('세율 0.0%') String tax,
    @Default('0만원') String afterTax,
    @Default(0) int prevPay,
    @Default('0.0%') String percent,
    @Default('0.0만원') String totalPayString,
    @Default('0만원') String prevPayString,
    @Default('0만원') String totalPayAnd,
    @Default('0공수') String workRecord,
    @Default(0) int normalDay,
    @Default('0만원') String normalPay,
    @Default(0) int extendDay,
    @Default('0만원') String extendPay,
    @Default(0) int nightDay,
    @Default('0만원') String nightPay,
    @Default(0) int extraDay,
    @Default(0) int offDay,

  }) = _LaborFiltedModel;


  factory LaborFiltedModel.fromJson(Map<String, dynamic> json) =>
      _$LaborFiltedModelFromJson(json);
}



class CombinedDataModel {
  final List<LabourCondition> contract;
  final List<WorkHistory> history;

  CombinedDataModel({required this.contract, required this.history});
}


