import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_time_model.freezed.dart';
part 'calendar_time_model.g.dart';

@freezed
class CalendarTimeModel with _$CalendarTimeModel {
  const factory CalendarTimeModel({
    required DateTime selected,
    required DateTime focused,
  }) = _CalendarTimeModel;

  factory CalendarTimeModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarTimeModelFromJson(json);
}