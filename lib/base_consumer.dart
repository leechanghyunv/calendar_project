import 'package:calendar_project_240727/model/calendar_time_model.dart';
import 'package:calendar_project_240727/model/contract_model.dart';
import 'package:calendar_project_240727/model/formz_decimal_model.dart';
import 'package:calendar_project_240727/model/work_history_model.dart';
import 'package:calendar_project_240727/repository/formz/formz_decimal.dart';

import 'package:calendar_project_240727/repository/formz/formz_memo.dart';
import 'package:calendar_project_240727/repository/formz/formz_model.dart';
import 'package:calendar_project_240727/repository/time/calendar_time_controll.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';
import 'package:calendar_project_240727/view_model/sqlite_model/contract_model.dart';
import 'package:calendar_project_240727/view_model/sqlite_model/history_model.dart';

import 'core/export_package.dart';
import 'model/formz_memo_model.dart';
import 'model/formz_model.dart';
import 'model/range_selected_model.dart';

extension ContractAndHistoryExtension on WidgetRef {
 AsyncValue<List<WorkHistory>> get history => watch(viewHistoryProvider);
 AsyncValue<List<LabourCondition>> get contract => watch(viewContractProvider);
}

extension RiverpodExtension on WidgetRef{

 CalendarTimeModel get timeManager => watch(timeManagerProvider);


 ContractForm get contractForm => watch(formzValidatorProvider);
 FormzValidator get formzWatch => watch(formzValidatorProvider.notifier);
 FormzValidator get formzRead => read(formzValidatorProvider.notifier);


DecimalForm get decimalState => watch(formzDecimalValidatorProvider);
FormzDecimalValidator get decimalRead => read(formzDecimalValidatorProvider.notifier);
FormzDecimalValidator get decimalWatch => watch(formzDecimalValidatorProvider.notifier);

 MemoForm get memoState => watch(formzMemoValidatorProvider);
 FormzMemoValidator get formzMemoWatch => watch(formzMemoValidatorProvider.notifier);
 FormzMemoValidator get formzMemoRead => read(formzMemoValidatorProvider.notifier);
}



extension TimerExtension on WidgetRef {
  RangeSelectedModel get rangeSelected => watch(rangeSelectManagerProvider);
  RangeSelectManager get rangeSelectNot => read(rangeSelectManagerProvider.notifier);

  DateTime get selected => timeManager.selected;
  TimeRangeManager get rangeNot => read(timeRangeManagerProvider.notifier);
  TimeManager get timeNot => read(timeManagerProvider.notifier);
  int get year => selected.year;
  int get month => selected.month;
  int get day => selected.day;

  String get monthString => selected.month.toString().padLeft(2, '0');
  String get dayString => selected.day.toString().padLeft(2, '0');

  // bool get startSelected => rangeSelected.startSelected;
  // bool get endSelected => rangeSelected.endSelected;

  DateTime get startDate => rangeNot.startDate;
  DateTime get endDate => rangeNot.endDate;
}


extension RiverpodRefreshExtension on WidgetRef {
  Future<void> refreshState(BuildContext context) async {
    read(timeManagerProvider.notifier).selectedNextDay();
  }
}



