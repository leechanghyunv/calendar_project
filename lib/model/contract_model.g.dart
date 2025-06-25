// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LabourCondition _$LabourConditionFromJson(Map<String, dynamic> json) =>
    _LabourCondition(
      id: (json['id'] as num?)?.toInt(),
      date: const DateTimeConverter().fromJson(json['date'] as String),
      goal: (json['goal'] as num?)?.toInt() ?? 0,
      normal: (json['normal'] as num?)?.toInt() ?? 0,
      extend: (json['extend'] as num?)?.toInt() ?? 0,
      night: (json['night'] as num?)?.toInt() ?? 0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      subsidy: (json['subsidy'] as num?)?.toInt() ?? 0,
      site: json['site'] as String? ?? '',
      job: json['job'] as String? ?? '',
    );

Map<String, dynamic> _$LabourConditionToJson(_LabourCondition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': const DateTimeConverter().toJson(instance.date),
      'goal': instance.goal,
      'normal': instance.normal,
      'extend': instance.extend,
      'night': instance.night,
      'tax': instance.tax,
      'subsidy': instance.subsidy,
      'site': instance.site,
      'job': instance.job,
    };
