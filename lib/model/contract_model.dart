

import 'package:isar/isar.dart';


part 'contract_model.g.dart';

@Collection()
class LabourCondition {

  Id id = Isar.autoIncrement;

  // @Index(unique: true)
  late DateTime date;

  late int goal;
  late int normal;
  late int extend;
  late int night;
  late double tax;

  LabourCondition({
    required this.date,
    this.goal = 0,
    this.normal = 0,
    this.extend = 0,
    this.night = 0,
    this.tax = 0.0,
  });
}