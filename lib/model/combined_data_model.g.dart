// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combined_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LaborStatsModel _$LaborStatsModelFromJson(Map<String, dynamic> json) =>
    _LaborStatsModel(
      subsidyWorkDay: (json['subsidyWorkDay'] as num?)?.toInt() ?? 0,
      totalSubsidy: (json['totalSubsidy'] as num?)?.toInt() ?? 0,
      workDay: (json['workDay'] as num?)?.toInt() ?? 0,
      totalPay: json['totalPay'] as String? ?? '0만원',
      totalPayAnd: json['totalPayAnd'] as String? ?? '0만원',
      workRecord: (json['workRecord'] as num?)?.toDouble() ?? 0.0,
      normalValue: (json['normalValue'] as num?)?.toDouble() ?? 0.0,
      normalDay: (json['normalDay'] as num?)?.toInt() ?? 0,
      extendValue: (json['extendValue'] as num?)?.toDouble() ?? 0.0,
      extendDay: (json['extendDay'] as num?)?.toInt() ?? 0,
      nightValue: (json['nightValue'] as num?)?.toDouble() ?? 0.0,
      nightDay: (json['nightDay'] as num?)?.toInt() ?? 0,
      extraValue: (json['extraValue'] as num?)?.toDouble() ?? 0.0,
      extraDay: (json['extraDay'] as num?)?.toInt() ?? 0,
      offDay: (json['offDay'] as num?)?.toInt() ?? 0,
      goalRate: json['goalRate'] as String? ?? '0%',
      goalRateAnd: json['goalRateAnd'] as String? ?? '0%',
      goalRateAfterTax: json['goalRateAfterTax'] as String? ?? '0%',
      goalRateAndAfterTax: json['goalRateAndAfterTax'] as String? ?? '0%',
      afterTaxTotal: json['afterTaxTotal'] as String? ?? '0만원',
      remainingAfterTax: json['remainingAfterTax'] as String? ?? '0만원',
      remainingGoalAfterTax: json['remainingGoalAfterTax'] as String? ?? '0공수',
    );

Map<String, dynamic> _$LaborStatsModelToJson(_LaborStatsModel instance) =>
    <String, dynamic>{
      'subsidyWorkDay': instance.subsidyWorkDay,
      'totalSubsidy': instance.totalSubsidy,
      'workDay': instance.workDay,
      'totalPay': instance.totalPay,
      'totalPayAnd': instance.totalPayAnd,
      'workRecord': instance.workRecord,
      'normalValue': instance.normalValue,
      'normalDay': instance.normalDay,
      'extendValue': instance.extendValue,
      'extendDay': instance.extendDay,
      'nightValue': instance.nightValue,
      'nightDay': instance.nightDay,
      'extraValue': instance.extraValue,
      'extraDay': instance.extraDay,
      'offDay': instance.offDay,
      'goalRate': instance.goalRate,
      'goalRateAnd': instance.goalRateAnd,
      'goalRateAfterTax': instance.goalRateAfterTax,
      'goalRateAndAfterTax': instance.goalRateAndAfterTax,
      'afterTaxTotal': instance.afterTaxTotal,
      'remainingAfterTax': instance.remainingAfterTax,
      'remainingGoalAfterTax': instance.remainingGoalAfterTax,
    };

_LaborFiltedModel _$LaborFiltedModelFromJson(Map<String, dynamic> json) =>
    _LaborFiltedModel(
      subsidyDay: (json['subsidyDay'] as num?)?.toInt() ?? 0,
      totalSubsidy: json['totalSubsidy'] as String? ?? '0만원',
      workDay: (json['workDay'] as num?)?.toInt() ?? 0,
      totalPay: (json['totalPay'] as num?)?.toInt() ?? 0,
      tax: json['tax'] as String? ?? '세율 0.0%',
      afterTax: json['afterTax'] as String? ?? '0만원',
      prevPay: (json['prevPay'] as num?)?.toInt() ?? 0,
      percent: json['percent'] as String? ?? '0.0%',
      totalPayString: json['totalPayString'] as String? ?? '0.0만원',
      prevPayString: json['prevPayString'] as String? ?? '0만원',
      totalPayAnd: json['totalPayAnd'] as String? ?? '0만원',
      workRecord: json['workRecord'] as String? ?? '0공수',
      normalDay: (json['normalDay'] as num?)?.toInt() ?? 0,
      normalPay: json['normalPay'] as String? ?? '0만원',
      extendDay: (json['extendDay'] as num?)?.toInt() ?? 0,
      extendPay: json['extendPay'] as String? ?? '0만원',
      nightDay: (json['nightDay'] as num?)?.toInt() ?? 0,
      nightPay: json['nightPay'] as String? ?? '0만원',
      extraDay: (json['extraDay'] as num?)?.toInt() ?? 0,
      offDay: (json['offDay'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$LaborFiltedModelToJson(_LaborFiltedModel instance) =>
    <String, dynamic>{
      'subsidyDay': instance.subsidyDay,
      'totalSubsidy': instance.totalSubsidy,
      'workDay': instance.workDay,
      'totalPay': instance.totalPay,
      'tax': instance.tax,
      'afterTax': instance.afterTax,
      'prevPay': instance.prevPay,
      'percent': instance.percent,
      'totalPayString': instance.totalPayString,
      'prevPayString': instance.prevPayString,
      'totalPayAnd': instance.totalPayAnd,
      'workRecord': instance.workRecord,
      'normalDay': instance.normalDay,
      'normalPay': instance.normalPay,
      'extendDay': instance.extendDay,
      'extendPay': instance.extendPay,
      'nightDay': instance.nightDay,
      'nightPay': instance.nightPay,
      'extraDay': instance.extraDay,
      'offDay': instance.offDay,
    };
