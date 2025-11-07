// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomEvent _$CustomEventFromJson(Map<String, dynamic> json) => _CustomEvent(
      id: (json['id'] as num?)?.toInt() ?? 0,
      date: const DateTimeConverter().fromJson(json['date'] as String),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CustomEventToJson(_CustomEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': const DateTimeConverter().toJson(instance.date),
      'name': instance.name,
    };
