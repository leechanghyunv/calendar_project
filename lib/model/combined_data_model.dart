import 'package:calendar_project_240727/model/work_history_model.dart';
import 'contract_model.dart';

class CombinedDataModel {
  final List<LabourCondition> contract;
  final List<WorkHistory> history;

  CombinedDataModel({required this.contract, required this.history});
}