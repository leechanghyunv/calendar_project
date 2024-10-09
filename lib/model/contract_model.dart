import 'package:isar/isar.dart';

part 'contract_model.g.dart';

@Collection()
class LabourCondition {

  Id id = Isar.autoIncrement;

  late DateTime date;

  late int goal;
  late int normal;
  late int extend;
  late int night;
  late double tax;
  late int subsidy;

  LabourCondition({
    required this.date,
    this.goal = 0,
    this.normal = 0,
    this.extend = 0,
    this.night = 0,
    this.tax = 0.0,
    this.subsidy = 0,
  });

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),   // DateTime을 문자열로 변환
    'goal': goal,
    'normal': normal,
    'extend': extend,
    'night': night,
    'tax': tax,
    'subsidy': subsidy,
  };

  // JSON 역직렬화
  factory LabourCondition.fromJson(Map<String, dynamic> json) {
    return LabourCondition(
      date: DateTime.parse(json['date']),   // 문자열을 DateTime으로 변환
      goal: json['goal'] ?? 0,
      normal: json['normal'] ?? 0,
      extend: json['extend'] ?? 0,
      night: json['night'] ?? 0,
      tax: json['tax'] ?? 0.0,
      subsidy: json['subsidy'] ?? 0,
    );
  }

  @override
  String toString() {
    return '날짜: $date, 목표: $goal, 정상: $normal, 연장: $extend, 야간: $night, 세금: $tax, 보조금: $subsidy';
  }




}