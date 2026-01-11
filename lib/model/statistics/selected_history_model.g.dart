// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SelectedHistory _$SelectedHistoryFromJson(Map<String, dynamic> json) =>
    _SelectedHistory(
      id: (json['id'] as num?)?.toInt(),
      startDate: const DateTimeConverter().fromJson(
        json['startDate'] as String,
      ),
      endDate: const DateTimeConverter().fromJson(json['endDate'] as String),
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      memo: json['memo'] as String? ?? '',
      money: (json['money'] as num?)?.toDouble() ?? 1.0,
      afterTax: (json['afterTax'] as num?)?.toDouble() ?? 1.0,
      record: (json['record'] as num?)?.toDouble() ?? 1.0,
      job: json['job'] as String? ?? '',
    );

Map<String, dynamic> _$SelectedHistoryToJson(_SelectedHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': const DateTimeConverter().toJson(instance.startDate),
      'endDate': const DateTimeConverter().toJson(instance.endDate),
      'duration': instance.duration,
      'memo': instance.memo,
      'money': instance.money,
      'afterTax': instance.afterTax,
      'record': instance.record,
      'job': instance.job,
    };
