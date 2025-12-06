// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StringItem _$StringItemFromJson(Map<String, dynamic> json) => _StringItem(
      id: (json['id'] as num?)?.toInt(),
      value: json['value'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$StringItemToJson(_StringItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'order': instance.order,
    };
