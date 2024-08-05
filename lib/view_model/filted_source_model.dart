import 'package:calendar_project_240727/view_model/contract_model.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/conbined_data_model.dart';
import '../model/work_history_model.dart';

part 'filted_source_model.g.dart';

@riverpod
class NumericSourceModel extends _$NumericSourceModel {

  late DateTime startDate;
  late DateTime endDate;

   List<WorkHistory> filteredHistory = [];

  int get goal => state.value?.contract.last.goal ?? 0;
  double get tax => state.value?.contract.last.tax ?? 0.0; /// %를 제외한 숫자로 나오기때문에 필터링
  double get filtedTax => tax/100; /// ex 0.2 -> 20%

  int get workDay => state.value?.history.length ?? 0;
  int get workDaynMonth => filteredHistory.length;

  int get totalPay => state.value?.history.fold(0,(p,e) => p + e.pay).toInt() ?? 0;
  int get totalPaynMonth => filteredHistory.fold(0,(p,e) => p + e.pay);
  double get workRecode => state.value?.history.fold(0.0,(p,e) => p! + e.record) ?? 0.0;
  double get workRecodenMonth => filteredHistory.fold(0.0,(p,e) => p + e.record);

  double get normalPay => filteredHistory.where((e) => e.record == 1.0).
  map((e) => e.record).fold(0.0, (value, element) => value + element);
  int get normalDay => filteredHistory.where((e) => e.record == 1.0).map((e) => e.record).length;
  /// 이번달의 정상근무 금액 총합 ex)15 공수 20공수
  double get extendPay => filteredHistory.where((e) => e.record == 1.5).
  map((e) => e.record).fold(0.0, (value, element) => value + element);
  int get extendDay => filteredHistory.where((e) => e.record == 1.5).map((e) => e.record).length;
  /// 이번달의 정상근무 금액 총합 ex)15 공수 20공수
  double get nightPay => filteredHistory.where((e) => e.record == 2.0).
  map((e) => e.record).fold(0.0, (value, element) => value + element);
  int get nightDay => filteredHistory.where((e) => e.record == 2.0).map((e) => e.record).length;

  double get goalRate => double.parse(((totalPay/goal) * 100).toStringAsFixed(2));
  /// 총 세후 금액
  double get afterTaxTotal => double.parse(
      (totalPay - (totalPay * filtedTax)).toStringAsFixed(1));
  /// 이번달 세후 금액
  double get afterTaxMonth {
    if (totalPaynMonth == 0) {
      return 0.0;
    }
    return double.parse(
        (totalPaynMonth - (totalPaynMonth * filtedTax)).toStringAsFixed(1)
    );
  }
  double get normalPercent => double.parse(((normalDay/workDaynMonth) * 100).toStringAsFixed(1));
  double get extendPercent => double.parse(((extendDay/workDaynMonth) * 100).toStringAsFixed(1));
  double get nightPercent => double.parse(((nightDay/workDaynMonth) * 100).toStringAsFixed(1));

  int get remaining {
    final parsedGoal = int.tryParse(goal.toString());
    if (parsedGoal == null) {
      return 0;
    }
    final difference = parsedGoal - totalPay;
    return difference.isNaN ? 0 : difference;
  }

  String get remainingGoal {
    final normalPay = state.value?.contract.last.normal ?? 1; // to avoid division by zero

    final remainingGoal = (remaining / normalPay).toStringAsFixed(0);
    return remainingGoal.isEmpty ? "0.0" : remainingGoal;
  }

 /// numericSourceModelProvider
  @override
  Future<ConbinedDataModel> build(DateTime time) async {
    return refreshData(time);
  }

  Future<ConbinedDataModel> refreshData(DateTime time) async {
    final contract = await ref.watch(viewContractProvider.future);
    final history = await ref.watch(viewHistoryProvider.future);

    startDate = DateTime(time.year, time.month, 1);
    endDate = DateTime(time.year, time.month + 1, 1).subtract(const Duration(seconds: 1));

    filteredHistory = history.where((item) {
      return item.date.isAfter(startDate) && item.date.isBefore(endDate);
    }).toList();
    print('refreshData ${history.last.comment} ${history.last.pay} ');
    return ConbinedDataModel(contract: contract, history: history);
  }


}
