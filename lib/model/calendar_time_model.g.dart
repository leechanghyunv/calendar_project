// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarTimeModelImpl _$$CalendarTimeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CalendarTimeModelImpl(
      selected: DateTime.parse(json['selected'] as String),
      focused: DateTime.parse(json['focused'] as String),
    );

Map<String, dynamic> _$$CalendarTimeModelImplToJson(
        _$CalendarTimeModelImpl instance) =>
    <String, dynamic>{
      'selected': instance.selected.toIso8601String(),
      'focused': instance.focused.toIso8601String(),
    };
