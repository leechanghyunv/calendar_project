// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchHistoryModel _$SearchHistoryModelFromJson(Map<String, dynamic> json) =>
    _SearchHistoryModel(
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      afterTax: (json['afterTax'] as num?)?.toDouble() ?? 0.0,
      record: (json['record'] as num?)?.toDouble() ?? 0.0,
      severancePay: (json['severancePay'] as num?)?.toDouble() ?? 0.0,
      wrd: (json['wrd'] as num?)?.toInt() ?? 0,
      workDay: (json['workDay'] as num?)?.toInt() ?? 0,
      workload: (json['workload'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$SearchHistoryModelToJson(_SearchHistoryModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'tax': instance.tax,
      'afterTax': instance.afterTax,
      'record': instance.record,
      'severancePay': instance.severancePay,
      'wrd': instance.wrd,
      'workDay': instance.workDay,
      'workload': instance.workload,
    };
