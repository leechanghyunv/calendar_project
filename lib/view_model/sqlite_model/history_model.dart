import 'package:calendar_project_240727/firebase_analytics.dart';
import 'package:calendar_project_240727/repository/formz/formz_memo.dart';
import 'package:calendar_project_240727/repository/sqlite/sqlite_history_database.dart';
import 'package:calendar_project_240727/repository/time/calendar_time_controll.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/export_package.dart';
import '../../model/work_history_model.dart';
import '../../view_ui/main_screen_component/main_box_component/controll_chip_component.dart';
import '../../view_ui/screen/contract_setting_screen/provider/settlement_state_provider.dart';
import '../../view_ui/screen/contract_setting_screen/provider/work_site_provider.dart';
import 'calendar_event_model.dart';
import 'contract_model.dart';
part 'history_model.g.dart';

void invalidateProviders(Ref ref) {
  ref.invalidate(calendarEventProvider);
  ref.invalidate(calendarTotalEventProvider);
  ref.invalidate(selectedChipIndexProvider);
  ref.invalidate(viewHistoryProvider);
}

@riverpod
Future<List<WorkHistory>> viewHistory(Ref ref) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  return db.getAllWorkHistories();
}

@riverpod
Future<List<WorkHistory>> viewRangeHistory(
    Ref ref, DateTime start, DateTime end) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  return db.getFilteredHistory(start, end);
}

@riverpod
Future<void> addAllHistory(Ref ref, List<WorkHistory> list) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  db.insertOrOverwriteWorkHistories(list);
  invalidateProviders(ref);
}

@riverpod
Future<void> addHistory(Ref ref,
    int pay, DateTime date,{double? decimal}) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  final contract = ref.watch(viewContractProvider);
  final memoNote = ref.watch(formzMemoValidatorProvider.notifier).value;
  final settlement = ref.watch(isSettlementProvider);

  final workSite = ref.watch(selectedWorksiteProvider);
  final Map<String, dynamic> event = {};
  late WorkHistory history;

  contract.when(
      data: (val) {
        final (comment, colorCode, record) = switch (pay) {
          _ when pay == val.last.normal => ('정상근무', '2196F3', 1.0),
          _ when pay == val.last.extend => ('연장근무', 'FCAF50', 1.5),
          _ when pay == val.last.night => ('야간근무', 'F44336', 2.0),
          0 => ('휴무', '4CAF50', 0.0),
          _ => ('기타근무', 'AB47BC', decimal ?? 1.0),
        };

        history = WorkHistory(
          date: date,
          comment: comment,
          pay: pay,
          colorCode: colorCode,
          record: record,
          memo: memoNote,
          workSite: workSite,
          subsidy: val.last.subsidy,
          settlement: settlement,

        );
      },
      error: (err, trace) => print(err.toString()),
      loading: () => print('loading....'));
  event.addAll({
    'recode': history.record,
    'pay': history.pay,
    'comment': history.comment,
    'date': DateFormat('yyyy-MM-dd').format(history.date),
    'memo': history.memo,
    'workSite': history.workSite,
    'subsidy': history.subsidy,
    'settlement': history.settlement,
  });
  ref.read(firebaseAnalyticsClassProvider.notifier).dailyEvent(event);
  db.insertOrUpdateWorkHistory(history);
  invalidateProviders(ref);
}

@riverpod
Future<void> rangeExcludHoliday(
    Ref ref, WorkHistory history,DateTime start,DateTime end) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
   db.insertWorkHistoryExcludeHolidays(start, end, history);
   invalidateProviders(ref);
}

@riverpod
Future<WorkHistory> latestHistory(Ref ref) async {
  final selected = ref.watch(timeManagerProvider.notifier);
  final history = ref.watch(viewHistoryProvider);

  return switch (history) {
    AsyncData(:final value) when value.isNotEmpty => WorkHistory(
      date: selected.DaySelected,
      comment: value.last.comment,
      pay: value.last.pay,
      colorCode: value.last.colorCode,
      record: value.last.record,
      memo: value.last.memo,
      workSite: value.last.workSite,
      subsidy: value.last.subsidy,
      settlement: value.last.settlement,
    ),
    _ => throw Exception('최근 기록을 찾을 수 없습니다'),
  };
}


@riverpod
Future<void> deleteHistory(Ref ref, DateTime time) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  print('deleteHistory $time');
  db.deleteWorkHistory(time);
  invalidateProviders(ref);
}

@riverpod
Future<void> deleteMonthHistory(
    Ref ref, DateTime start, DateTime end) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  print('deleteMonthHistory $start $end');
  db.deleteWorkHistoryByMonth(start, end);
  invalidateProviders(ref);
}

@riverpod
Future<void> clearHistory(Ref ref) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  db.clearWorkHistory();
  invalidateProviders(ref);
}

@riverpod
Future<void> updateMemoHistory(
    Ref ref, DateTime date, String memo) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  db.updateMemo(date, memo);
  invalidateProviders(ref);
}
