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

  @Default('정상근무') String comment;

  WorkHistory({
    required this.date,
    this.pay = 0,
    this.record = 1.0,
    this.colorCode = '2196F3',
    this.comment = '정상근무',
  });
}