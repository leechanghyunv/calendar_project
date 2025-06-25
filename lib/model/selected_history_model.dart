import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_history_model.freezed.dart';
part 'selected_history_model.g.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}


@freezed
abstract class SelectedHistory with _$SelectedHistory {
  const factory SelectedHistory({
    int? id,
    @DateTimeConverter()
    required DateTime startDate,
    @DateTimeConverter()
    required DateTime endDate,
    @Default(0) int duration,
    @Default('') String memo,
    @Default(1.0) double money,
    @Default(1.0) double record,
    @Default('') String job,
  }) = _SelectedHistory;

  factory SelectedHistory.fromJson(Map<String, dynamic> json) =>
      _$SelectedHistoryFromJson(json);

  const SelectedHistory._();

  Map<String, dynamic> toMap() => {
    'id': id,
    'startDate': startDate.toIso8601String(),
    'endDate': endDate.toIso8601String(),
    'duration': duration, ///
    'memo': memo,
    'money': money,
    'record': record,
    'job': job,
  };

  static SelectedHistory fromMap(Map<String, dynamic> map) {
    return SelectedHistory(
      id: map['id'] as int?,
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      duration: int.tryParse(map['duration'].toString()) ?? 0,
      memo: map['memo'] as String,
      money: (map['money'] as num).toDouble(),
      record: (map['record'] as num).toDouble(),
      job: map['job'] as String,
    );
  }

}