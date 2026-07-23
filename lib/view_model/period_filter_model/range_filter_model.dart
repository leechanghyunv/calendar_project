import 'package:dartx/dartx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/combined_data_model.dart';
import '../../model/work_history_model.dart';
import '../sqlite_model/contract_model.dart';
import '../sqlite_model/history_model.dart';


part 'range_filter_model.g.dart';

@riverpod
class RangeSource extends _$RangeSource {

  List<WorkHistory> historyRange = [];

  int get workDayRange => historyRange.count((e) => e.record != 0.0);
  /// 출력일수
  int get totalPayRange => historyRange.sumBy((e) => e.pay);
  /// 총 급여
  double get workRecodeRange => historyRange.sumBy((e) => e.record);
  /// 총 공수

/// rangeFiltedSourceModelprovider
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
