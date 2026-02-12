
import '../../../../repository/repository_import.dart';
import '../../../../repository/time/calendar_time_controll.dart';

part 'settlement_state_provider.g.dart';

@riverpod
class IsSettlement extends _$IsSettlement {
  @override

  bool build(){
    final selected = ref.watch(timeManagerProvider).selected;
    final historyAsync = ref.watch(viewHistoryProvider);

    return historyAsync.when(
      data: (histories) {
        final found = histories.firstWhere(
              (h) => h.date.year == selected.year &&
              h.date.month == selected.month &&
              h.date.day == selected.day,
          orElse: () => WorkHistory(date: selected),
        );
        return found.settlement;
      },
      loading: () => false,
      error: (_, __) => false,
    );
  }


}
