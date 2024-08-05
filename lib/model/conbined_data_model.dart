import 'package:calendar_project_240727/model/work_history_model.dart';
import 'contract_model.dart';

class ConbinedDataModel {
  final List<LabourCondition> contract;
  final List<WorkHistory> history;

  ConbinedDataModel({required this.contract, required this.history});
}