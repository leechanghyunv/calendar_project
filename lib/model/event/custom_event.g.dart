// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomEvent _$CustomEventFromJson(Map<String, dynamic> json) => _CustomEvent(
      id: (json['id'] as num?)?.toInt() ?? 0,
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CustomEventToJson(_CustomEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'name': instance.name,
    };
