// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkHistoryImpl _$$WorkHistoryImplFromJson(Map<String, dynamic> json) =>
    _$WorkHistoryImpl(
      id: (json['id'] as num?)?.toInt(),
      date: const DateTimeConverter().fromJson(json['date'] as String),
      pay: (json['pay'] as num?)?.toInt() ?? 0,
      record: (json['record'] as num?)?.toDouble() ?? 1.0,
      colorCode: json['colorCode'] as String? ?? '2196F3',
      comment: json['comment'] as String? ?? '정상근무',
      memo: json['memo'] as String? ?? '',
    );

Map<String, dynamic> _$$WorkHistoryImplToJson(_$WorkHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': const DateTimeConverter().toJson(instance.date),
      'pay': instance.pay,
      'record': instance.record,
      'colorCode': instance.colorCode,
      'comment': instance.comment,
      'memo': instance.memo,
    };
