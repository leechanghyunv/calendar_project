import 'package:calendar_project_240727/repository/home_widget_repository.dart';
import 'package:dartx/dartx.dart';

import '../../repository/repository_import.dart';

part 'weekly_filter_model.g.dart';

@riverpod
class WeekRecord extends _$WeekRecord {

  @override
  Future<void> build() async {
    await _calculate();
  }

  // ✅ 외부에서 수동 호출 가능
  Future<void> refresh() async {
    state = const AsyncLoading();
    await _calculate();
  }

  Future<void> _calculate() async {
    final range = _getCurrentWeekRange();

    final contract = await ref.watch(viewContractProvider.future);
    final history = await ref.watch(viewRangeHistoryProvider(range.startDate, range.endDate).future);

    if (history.isEmpty || contract.isEmpty) return;

    final totalPay = history.sumBy((e) => e.pay);
    final workRecord = history.sumBy((e) => e.record);

    ref.read(widgetBridgeProvider.notifier).saveWage(totalPay);
    ref.read(widgetBridgeProvider.notifier).saveWorkRecord(workRecord);
  }

  ({DateTime startDate, DateTime endDate}) _getCurrentWeekRange() {
    final now = DateTime.now().date;
    final startDate = now.copyWith(day: now.day - (now.weekday - 1));
    final endDate = startDate.copyWith(day: startDate.day + 6);
    return (startDate: startDate, endDate: endDate);
  }
  
  }

