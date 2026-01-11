// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'column_box_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ColumnBoxValueModel _$ColumnBoxValueModelFromJson(Map<String, dynamic> json) =>
    _ColumnBoxValueModel(
      workDayValue: (json['workDayValue'] as num?)?.toInt() ?? 0,
      extraDay: (json['extraDay'] as num?)?.toInt() ?? 0,
      wrd: (json['wrd'] as num?)?.toInt() ?? 0,
      text1: json['text1'] as String? ?? '퇴직공제금은 0만원, 신청자격일수 252일 중 0% 달성',
      text2: json['text2'] as String? ?? '근로일수는 0일, 실업급여 조건 0% 달성',
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
      wrdProgress: (json['wrdProgress'] as num?)?.toDouble() ?? 0.0,
      workDayProgress: (json['workDayProgress'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$ColumnBoxValueModelToJson(
  _ColumnBoxValueModel instance,
) => <String, dynamic>{
  'workDayValue': instance.workDayValue,
  'extraDay': instance.extraDay,
  'wrd': instance.wrd,
  'text1': instance.text1,
  'text2': instance.text2,
  'percentage': instance.percentage,
  'wrdProgress': instance.wrdProgress,
  'workDayProgress': instance.workDayProgress,
};
