import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/combined_data_model.dart';
import '../model/work_history_model.dart';
import 'contract_model.dart';
import 'history_model.dart';

part 'range_filted_model.g.dart';

@riverpod
class RangeFiltedSourceModel extends _$RangeFiltedSourceModel {

  List<WorkHistory> historyRange = [];

  double get tax => state.value?.contract.last.tax ?? 0.0; /// %를 제외한 숫자로 나오기때문에 필터링
  double get filtedTax => tax/100; /// ex 0.2 -> 20%
  ///
  int get workDayRange => historyRange.where((e) => e.record != 0.0).length;
  /// 출력일수
  int get totalPayRange => historyRange.fold(0,(p,e) => p + e.pay);
  /// 총 급여
  double get workRecodeRange => historyRange.fold(0.0,(p,e) => p + e.record);
  /// 총 공수

  double get afterTaxTotal {
    // totalPay가 null 또는 0인지 확인
    if (totalPayRange <= 0) {
      return 0.0; // totalPay가 유효하지 않으면 0 반환
    }
    // filtedTax가 null일 경우 0으로 처리
    double taxRate = filtedTax ?? 0;
    // 세후 총액 계산
    double afterTaxAmount = totalPayRange - (totalPayRange * taxRate);
    // 계산 결과가 유효한지 확인
    if (afterTaxAmount < 0) {
      return 0.0; // 음수가 되지 않도록 처리
    }
    return double.parse(afterTaxAmount.toStringAsFixed(1));
  }
  /// 세후금액



  @override
  Future<CombinedDataModel> build(DateTime start, DateTime end) async {
    return refreshData(start,end);
  }

  Future<CombinedDataModel> refreshData(DateTime start,DateTime end) async {

    bool isValidDateRange(DateTime start, DateTime end) {
      if (start.isAfter(end)) return false;
      if (end.difference(start).inDays < 0) return false; // 음수 일수 방지
      return true;
    }

    if (!isValidDateRange(start, end)) {


    }

    final contract = await ref.watch(viewContractProvider.future);
    final history = await ref.watch(viewHistoryProvider.future);

    historyRange = history.where((item) {
      return (item.date.isAtSameMomentAs(start) || item.date.isAfter(start)) &&
          (item.date.isAtSameMomentAs(end) || item.date.isBefore(end));
    }).toList();

    return CombinedDataModel(contract: contract, history: history);
  }

}
