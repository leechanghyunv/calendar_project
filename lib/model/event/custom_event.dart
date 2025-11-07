import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_event.freezed.dart';
part 'custom_event.g.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}

@freezed
abstract class CustomEvent with _$CustomEvent {
  const factory CustomEvent({
    @Default(0) int id,
    @DateTimeConverter() // 커스텀 컨버터 적용
    required DateTime date,
    @Default('') String name,
  }) = _CustomEvent;

  factory CustomEvent.fromJson(Map<String, dynamic> json) =>
      _$CustomEventFromJson(json);
}