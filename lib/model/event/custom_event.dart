import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_event.freezed.dart';
part 'custom_event.g.dart';

@freezed
abstract class CustomEvent with _$CustomEvent {
  const factory CustomEvent({
    @Default(0) int id,
    required DateTime date,
    @Default('') String name,
  }) = _CustomEvent;

  factory CustomEvent.fromJson(Map<String, dynamic> json) =>
      _$CustomEventFromJson({
        ...json,
        'date': json['date'] is String
            ? DateTime.parse(json['date'])
            : json['date'],
      });
}