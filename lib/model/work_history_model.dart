import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'work_history_model.g.dart';

@Collection()
class WorkHistory {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late DateTime date;

  late int pay;
  double record;
  late String colorCode;
  String memo;

  @Default('정상근무') String comment;

  WorkHistory({
    required this.date,
    this.pay = 0,
    this.record = 1.0,
    this.colorCode = '2196F3',
    this.comment = '정상근무',
    this.memo = '',
  });

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(), // DateTime을 문자열로 변환
    'pay': pay,
    'record': record,
    'colorCode': colorCode,
    'memo': memo,
    'comment': comment,
  };

  // JSON 역직렬화
  factory WorkHistory.fromJson(Map<String, dynamic> json) {
    return WorkHistory(
      date: DateTime.parse(json['date']), // 문자열을 DateTime으로 변환
      pay: json['pay'] ?? 0,
      record: json['record'] ?? 1.0,
      colorCode: json['colorCode'] ?? '2196F3',
      memo: json['memo'] ?? '',
      comment: json['comment'] ?? '정상근무',
    );
  }

  @override
  String toString() {
    return '날짜: $date, 급여: $pay, 기록: $record, 색상 코드: $colorCode, 메모: $memo, 코멘트: $comment';
  }

}