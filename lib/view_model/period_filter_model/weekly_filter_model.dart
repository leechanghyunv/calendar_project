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
    final contract = await ref.read(viewContractProvider.future);
    final history = await ref.read(viewRangeHistoryProvider(range.startDate, range.endDate).future);


    if (history.isEmpty || contract.isEmpty) return;

    final totalPay = history.sumBy((e) => e.pay);
    final workRecord = history.sumBy((e) => e.record);


    final bridge = ref.read(widgetBridgeProvider.notifier);

    await bridge.saveWage(totalPay);
    await bridge.saveWorkRecord(workRecord);
    await bridge.updateWidget();

  }

  ({DateTime startDate, DateTime endDate}) _getCurrentWeekRange() {
    final now = DateTime.now().date;
    final startDate = now.copyWith(day: now.day - (now.weekday - 1));
    // final endDate = startDate.copyWith(day: startDate.day + 6);
    final endDate = startDate
        .add(const Duration(days: 6))
        .copyWith(hour: 23, minute: 59, second: 59, millisecond: 999);
    return (startDate: startDate, endDate: endDate);
  }
  
  }

