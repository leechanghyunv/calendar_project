// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DateRangeModel _$DateRangeModelFromJson(Map<String, dynamic> json) =>
    _DateRangeModel(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$DateRangeModelToJson(_DateRangeModel instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
