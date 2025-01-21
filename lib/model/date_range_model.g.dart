// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateRangeModelImpl _$$DateRangeModelImplFromJson(Map<String, dynamic> json) =>
    _$DateRangeModelImpl(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$DateRangeModelImplToJson(
        _$DateRangeModelImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
