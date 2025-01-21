

import 'package:calendar_project_240727/repository/time/calendar_time_controll.dart';
import 'package:calendar_project_240727/view_model/filted_source_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/work_history_model.dart';

part 'work_day_provider.g.dart';

@riverpod
Future<int> workDay(WorkDayRef ref) async {
  final selected = ref.watch(timeManagerProvider).selected;
  final workDay = ref.watch(
    numericSourceModelProvider(selected).select(
            (data) => data.value?.history.where((e) => e.record != 0.0).length ?? 0
    )
  );
  return workDay;
}


class MonthPayData {
  final int payValue;
  final double taxValue;
  final double afterTaxValue;

  MonthPayData({
    required this.payValue,
    required this.taxValue,
    required this.afterTaxValue,
  });
}


@riverpod
Future<MonthPayData> monthPay(MonthPayRef ref) async {

  List<WorkHistory> filteredHistory = [];

  int payValue = 0;
  double taxValue = 0.0;
  double afterTaxValue = 0.0;

  final selected = ref.watch(timeManagerProvider).selected;
  final numeric = ref.watch(numericSourceModelProvider(selected));

  final startDate = DateTime(selected.year, selected.month, 1);
  final endDate = DateTime(selected.year, selected.month + 1, 1).subtract(const Duration(seconds: 1));

  numeric.when(data: (val){
    filteredHistory = val.history.where((item) {
      return item.date.isAfter(startDate) && item.date.isBefore(endDate);
    }).toList();

    taxValue = val.contract.last.tax;

    payValue = filteredHistory.fold(0,(p,e) => p + e.pay);

    afterTaxValue = double.parse((payValue - (payValue * taxValue/100)).toStringAsFixed(1)).isNaN ? 0.0
        : double.parse((payValue - (payValue * taxValue/100)).toStringAsFixed(1));

  }, error: (err,trace){}, loading: (){});

  // MonthPayData 인스턴스를 반환
  return MonthPayData(
    payValue: payValue,
    taxValue: taxValue,
    afterTaxValue: afterTaxValue,
  );
}



@riverpod
Future<int> prevMonthPay(PrevMonthPayRef ref) async {

  List<WorkHistory> prevHistory = [];

  int payValue = 0;

  final selected = ref.watch(timeManagerProvider).selected;
  final numeric = ref.watch(numericSourceModelProvider(selected));

  final prevStartDate = DateTime(selected.year, selected.month - 1, 1);
  final prevEndDate = DateTime(selected.year, selected.month, 1).subtract(const Duration(seconds: 1));

  numeric.when(data: (val){
    prevHistory = val.history.where((item) {
      return item.date.isAfter(prevStartDate) && item.date.isBefore(prevEndDate);
    }).toList();

    payValue = prevHistory.fold(0,(p,e) => p + e.pay);


  }, error: (err,trace){}, loading: (){});

  return payValue;
}
