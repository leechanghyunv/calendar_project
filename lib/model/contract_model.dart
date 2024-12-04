import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_model.freezed.dart';
part 'contract_model.g.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime dateTime) => dateTime.toIso8601String();
}

@freezed
class LabourCondition with _$LabourCondition {
  const factory LabourCondition({
    int? id,
    @DateTimeConverter()
    required DateTime date,
    @Default(0) int goal,
    @Default(0) int normal,
    @Default(0) int extend,
    @Default(0) int night,
    @Default(0.0) double tax,
    @Default(0) int subsidy,
  }) = _LabourCondition;

  factory LabourCondition.fromJson(Map<String, dynamic> json) =>
      _$LabourConditionFromJson(json);
  // SQLite 변환을 위한 메서드들
  const LabourCondition._();  // private 생성자
  // SQLite Map으로 변환
  Map<String, dynamic> toMap() => {
    'id': id,
    'date': date.toIso8601String(),
    'goal': goal,
    'normal': normal,
    'extend': extend,
    'night': night,
    'tax': tax,
    'subsidy': subsidy,
  };
  // SQLite Map에서 객체 생성
  static LabourCondition fromMap(Map<String, dynamic> map) {
    return LabourCondition(
      id: map['id'] as int?,
      date: DateTime.parse(map['date']),
      goal: map['goal'] as int,
      normal: map['normal'] as int,
      extend: map['extend'] as int,
      night: map['night'] as int,
      tax: (map['tax'] as num).toDouble(),
      subsidy: map['subsidy'] as int,
    );
  }
}