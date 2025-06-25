// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarTimeModel _$CalendarTimeModelFromJson(Map<String, dynamic> json) =>
    _CalendarTimeModel(
      selected: DateTime.parse(json['selected'] as String),
      focused: DateTime.parse(json['focused'] as String),
    );

Map<String, dynamic> _$CalendarTimeModelToJson(_CalendarTimeModel instance) =>
    <String, dynamic>{
      'selected': instance.selected.toIso8601String(),
      'focused': instance.focused.toIso8601String(),
    };
