import 'package:calendar_project_240727/model/calendar_time_model.dart';
import 'package:calendar_project_240727/model/combined_data_model.dart';
import 'package:calendar_project_240727/model/contract_model.dart';
import 'package:calendar_project_240727/model/formz_decimal_model.dart';
import 'package:calendar_project_240727/model/work_history_model.dart';
import 'package:calendar_project_240727/repository/formz/formz_decimal.dart';

import 'package:calendar_project_240727/repository/formz/formz_memo.dart';
import 'package:calendar_project_240727/repository/formz/formz_model.dart';
import 'package:calendar_project_240727/repository/time/calculate_day.dart';
import 'package:calendar_project_240727/repository/time/calendar_time_controll.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';
import 'package:calendar_project_240727/view_model/calendar_event_model.dart';
import 'package:calendar_project_240727/view_model/contract_model.dart';
import 'package:calendar_project_240727/view_model/filted_source_model.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:calendar_project_240727/view_model/range_filted_model.dart';
import 'package:intl/intl.dart';

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
 AsyncValue<CombinedDataModel> get combinedData => watch(numericSourceModelProvider(timeManager.selected));
 NumericSourceModel get numericSource => watch(numericSourceModelProvider(timeManager.selected).notifier);
 AsyncValue<Map<DateTime,List<WorkHistory>>> get calendarEvent => watch(calendarEventProvider);

 ContractForm get contractForm => watch(formzValidatorProvider);
 FormzValidator get formzWatch => watch(formzValidatorProvider.notifier);
 FormzValidator get formzRead => read(formzValidatorProvider.notifier);


DecimalForm get decimalState => watch(formzDecimalValidatorProvider);
FormzDecimalValidator get decimalRead => read(formzDecimalValidatorProvider.notifier);
FormzDecimalValidator get decimalWatch => watch(formzDecimalValidatorProvider.notifier);

 MemoForm get memoState => watch(formzMemoValidatorProvider);
 FormzMemoValidator get formzMemoWatch => watch(formzMemoValidatorProvider.notifier);
 FormzMemoValidator get formzMemoRead => read(formzMemoValidatorProvider.notifier);


 int get extraDay => watch(calculateValueProvider);
}

extension TimerValueExtension on WidgetRef {


  int get workDay => numericSource.workDay.isNaN ? 0 : numericSource.workDay;


 double get percentage => (workDay/180 * 100);
 String get persent => (percentage > 100 ? 100 : percentage).toStringAsFixed(0);
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
  String get yearTwoDigits => DateFormat('yy').format(selected);

  bool get startSelected => rangeSelected.startSelected;
  bool get endSelected => rangeSelected.endSelected;

  DateTime get startDate => rangeNot.startDate;
  DateTime get endDate => rangeNot.endDate;


}

extension NumericValueExtension on WidgetRef {
  double get pay => numericSource.totalPay.toDouble();
  int get subsidy => numericSource.subsidy;
  double get totalAnd => numericSource.totalPayAnd.toDouble();
}



extension smallboxExtension on WidgetRef {

  String get goalRateAfterTax => combinedData.when(
    data: (val){
      final dat = numericSource.goalRateAfterTax > 10 ? 2 : 3;
      if(val.history.isEmpty || val.contract.isEmpty){
        return '0.000';
      }
      return numericSource.goalRateAfterTax >= 100
          ? '100'
          : numericSource.goalRateAfterTax.toStringAsFixed(dat);
    }, error: (err,trace) => '', loading: ()=> '',
  );

  String get goalRatePlusAfterTax => combinedData.when(
    data: (val){
      final dat = numericSource.goalRateAndAfterTax > 10 ? 2 : 3;
      if(val.history.isEmpty || val.contract.isEmpty){
        return '0.000';
      }
      return numericSource.goalRateAndAfterTax >= 100
          ? '100'
          : numericSource.goalRateAndAfterTax.toStringAsFixed(dat);
    }, error: (err,trace) => '', loading: ()=> '',
  );

  String get remainingGoalAfterTax => combinedData.when(data: (val){
    if(val.history.isEmpty || val.contract.isEmpty){
      return '0.0';
    }
    return int.parse(numericSource.remainingGoalAfterTax)
        >= 0 ? numericSource.remainingGoalAfterTax
        : '0';
  }, error: (err,trace) => '', loading: ()=> '',
  );

  String get remainingGoalPlusAfterTax => combinedData.when(data: (val){
    if(val.history.isEmpty || val.contract.isEmpty){
      return '0.0';
    }
    return int.parse(numericSource.remainingGoalPlusAfterTax)
        >= 0 ? numericSource.remainingGoalPlusAfterTax
        : '0';
  }, error: (err,trace) => '', loading: ()=> '',
  );

  bool get goalFinished => goalRatePlusAfterTax == '100' && goalRateAfterTax == '100' ? true : false;

}


extension RiverpodRefreshExtension on WidgetRef {
  Future<void> refreshState(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 250), () {
      refresh(calendarEventProvider);
      read(timeManagerProvider.notifier).selectedNextDay();
      Navigator.pushReplacementNamed(context, '/main');
    });
  }


  Future<void> refreshgoal(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 250), () {
      refresh(viewContractProvider);
      refresh(viewHistoryProvider);
      read(timeManagerProvider.notifier).selectedNextDay();
      Navigator.pop(context);
    });
  }

  Future<void> refreshRange(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 250), () {
      refresh(rangeFiltedSourceModelProvider(startDate,endDate));
      refresh(viewContractProvider);
      refresh(viewHistoryProvider);
      read(timeManagerProvider.notifier).selectedNextDay();
    });
  }



}



