import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_history_model.freezed.dart';
part 'work_history_model.g.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}

@freezed
abstract class WorkHistory with _$WorkHistory {
  const factory WorkHistory({
    int? id,
    @DateTimeConverter() // 커스텀 컨버터 적용
    required DateTime date,
    @Default(0) int pay,
    @Default(1.0) double record,
    @Default('2196F3') String colorCode,
    @Default('정상근무') String comment,
    @Default('') String memo,
    @Default('') String workSite,        // 🆕 작업현장
  }) = _WorkHistory;

  factory WorkHistory.fromJson(Map<String, dynamic> json) =>
      _$WorkHistoryFromJson(json);

  const WorkHistory._();

  Map<String, dynamic> toMap() => {
    'id': id,
    'date': date.toIso8601String(),
    'pay': pay,
    'record': record,
    'colorCode': colorCode,
    'memo': memo,
    'comment': comment,
    'workSite': workSite,           


  };

  static WorkHistory fromMap(Map<String, dynamic> map) {
    return WorkHistory(
      id: map['id'] as int?,
      date: DateTime.parse(map['date']),
      pay: map['pay'] as int,
      record: map['record'] as double,
      colorCode: map['colorCode'] as String,
      memo: map['memo'] as String,
      comment: map['comment'] as String,
      workSite: map['workSite'] as String,              // 🆕


    );
  }
}
