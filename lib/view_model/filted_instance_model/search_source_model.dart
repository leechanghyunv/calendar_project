import 'package:calendar_project_240727/repository/time/calculate_ranged_day.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';

import '../../model/combined_data_model.dart';
import '../../model/search_history_model.dart';
import '../../repository/repository_import.dart';

part 'search_source_model.g.dart';

@riverpod
class SearchSourceModel extends _$SearchSourceModel {
  @override
  Future<SearchHistoryModel> build() async {
    final contractAsync = ref.watch(viewContractProvider);
    final historyAsync = ref.watch(viewHistoryProvider);
    final timeRange = ref.watch(timeRangeManagerProvider);
    final extraDay = ref.watch(calculatedRangeProvider(timeRange.startDate,timeRange.endDate));

    if (!contractAsync.hasValue || !historyAsync.hasValue) {
      return const SearchHistoryModel();
    }
    final contract = contractAsync.value!;
    final history = historyAsync.value!;

    if (history.isEmpty || contract.isEmpty) {
      return  SearchHistoryModel();
    }
    return await _SearchModelState(
        CombinedDataModel(contract: contract, history: history),
        DateRangeModel(startDate: timeRange.startDate, endDate: timeRange.endDate),
        extraDay,
    );
  }

}

SearchHistoryModel _SearchModelState(
    CombinedDataModel data,DateRangeModel range,int extraDay){
  final contract = data.contract;
  final history = data.history;
  final start = range.startDate;
  final end = range.endDate;

  final filteredHistory = _filterHistoryByDateRange(history, start, end);

  final workDay = filteredHistory.where((e) => e.record != 0.0).length;
  final totalPay = filteredHistory.fold(0, (p, e) => p + e.pay);
  final workRecord = filteredHistory.fold(0.0, (p, e) => p + e.record);

  final wrd = workDay + extraDay;
  final severancePay = (wrd * 6200) / 10000;

  // final total = wrd / 252;
  // final getRate = (total * 100).clamp(0.0, 100);
  // final percentage = (workDay / 180 * 100);
  // final percent = (percentage > 100 ? 100 : percentage).toStringAsFixed(0);

  final double afterTax = totalPay <= 0 ? 0.0 : double.parse((totalPay * (1 - (contract.last.tax ?? 0))).toStringAsFixed(1));

  return SearchHistoryModel(
    total: totalPay.toDouble(),
    tax: contract.last.tax,
    afterTax: afterTax,
    record: workRecord,
    severancePay: severancePay,
    wrd: wrd,
    workDay: workDay,
    workload: workRecord/workDay,
  );
}

List<WorkHistory> _filterHistoryByDateRange(
    List<WorkHistory> history,
    DateTime start,
    DateTime end,
    ) {
  try {
    final filteredList = history.where((item) =>
    (item.date.isAtSameMomentAs(start) || item.date.isAfter(start)) &&
        (item.date.isAtSameMomentAs(end) || item.date.isBefore(end))
    ).toList();

    return filteredList;
  } catch (e) {
    print('날짜 필터링 중 오류 발생: $e');
    return []; // 오류 발생 시 빈 리스트 반환
  }
}