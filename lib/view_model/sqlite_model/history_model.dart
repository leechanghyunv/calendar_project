import 'package:calendar_project_240727/firebase_analytics.dart';
import 'package:calendar_project_240727/repository/formz/formz_decimal.dart';
import 'package:calendar_project_240727/repository/formz/formz_memo.dart';
import 'package:calendar_project_240727/repository/sqlite/sqlite_history_database.dart';
import 'package:calendar_project_240727/repository/time/calendar_time_controll.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/export_package.dart';
import '../../model/work_history_model.dart';
import '../../view_ui/main_screen_component/main_box_component/main_box_chip_list.dart';
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
Future<List<WorkHistory>> viewHistory(ViewHistoryRef ref) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  return db.getAllWorkHistories();
}

@riverpod
Future<List<WorkHistory>> viewRangeHistory(
    ViewRangeHistoryRef ref, DateTime start, DateTime end) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  return db.getFilteredHistory(start, end);
}

@riverpod
Future<void> addAllHistory(AddAllHistoryRef ref, List<WorkHistory> list) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  db.insertOrOverwriteWorkHistories(list);
  invalidateProviders(ref);
}

@riverpod
Future<void> addHistory(AddHistoryRef ref,
    int pay, DateTime date,{double? decimal}) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  final contract = ref.watch(viewContractProvider);
  final memoNote = ref.watch(formzMemoValidatorProvider.notifier).value;

  final Map<String, dynamic> event = {};
  late WorkHistory history;

  contract.when(
      data: (val) {
        if (pay == contract.value!.last.normal) {
          history = WorkHistory(
            date: date,
            comment: '정상근무',
            pay: val.last.normal,
            colorCode: '2196F3',
            record: 1.0,
            memo: memoNote,
          );
        } else if (pay == contract.value!.last.extend) {
          history = WorkHistory(
              date: date,
              comment: '연장근무',
              pay: val.last.extend,
              colorCode: 'FCAF50',
              record: 1.5,
              memo: memoNote);
        } else if (pay == contract.value!.last.night) {
          history = WorkHistory(
              date: date,
              comment: '야간근무',
              pay: val.last.night,
              colorCode: 'F44336',
              record: 2.0,
              memo: memoNote);
        } else if (pay == 0) {
          history = WorkHistory(
            date: date,
            comment: '휴무',
            pay: pay, // 기본값 혹은 예외 처리
            colorCode: '4CAF50',
            record: 0.0,
            memo: memoNote,
          );
        } else if (decimal != null && decimal != 0.0){
          history = WorkHistory(
            date: date,
            comment: '기타근무',
            pay: pay, // 기본값 혹은 예외 처리
            colorCode: 'AB47BC',
            record: decimal,
            memo: memoNote,
          );

        }
      },
      error: (err, trace) => print(err.toString()),
      loading: () => print('loading....'));
  event.addAll({
    'recode': history.record,
    'pay': history.pay,
    'comment': history.comment,
    'date': DateFormat('yyyy-MM-dd').format(history.date),
    'memo': history.memo,
  });

  ref.read(firebaseAnalyticsClassProvider.notifier).dailyEvent(event);

  db.insertOrUpdateWorkHistory(history);
  invalidateProviders(ref);
}

@riverpod
Future<void> rangeExcludHoliday(
    RangeExcludHolidayRef ref, WorkHistory history) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  final selected = ref.watch(timeManagerProvider.notifier).DaySelected;

  final start = DateTime(selected.year, selected.month, 1);
  final end = DateTime(selected.year, selected.month + 1, 1)
      .subtract(Duration(days: 1));

  return db.insertWorkHistoryExcludeHolidays(start, end, history);
}

@riverpod
Future<void> latestHistory(LatestHistoryRef ref) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  final contract = ref.watch(viewContractProvider);
  final selected = ref.watch(timeManagerProvider.notifier);
  final history = ref.watch(viewHistoryProvider);

  late WorkHistory latest;

  contract.maybeWhen(
      data: (val) {
        history.when(
            data: (val) {
              latest = WorkHistory(
                  date: selected.DaySelected,
                  comment: val.last.comment,
                  pay: val.last.pay,
                  colorCode: val.last.colorCode,
                  record: val.last.record,
                  memo: val.last.memo);
              print('latest: $latest');
            },
            error: (err, trace) => print(err.toString()),
            loading: () => print('loading....'));
      },
      orElse: () => print('근로설정데이터가 없습니다.'));


  db.insertOrUpdateWorkHistory(latest);
  invalidateProviders(ref);
}

@riverpod
Future<void> deleteHistory(DeleteHistoryRef ref, DateTime time) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  print('deleteHistory $time');
  db.deleteWorkHistory(time);
  invalidateProviders(ref);
}

@riverpod
Future<void> deleteMonthHistory(
    DeleteMonthHistoryRef ref, DateTime start, DateTime end) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  db.deleteWorkHistoryByMonth(start, end);
  invalidateProviders(ref);
}

@riverpod
Future<void> clearHistory(ClearHistoryRef ref) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  db.clearWorkHistory();
  invalidateProviders(ref);
}

@riverpod
Future<void> updateMemoHistory(
    UpdateMemoHistoryRef ref, DateTime date, String memo) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  db.updateMemo(date, memo);
  invalidateProviders(ref);
}
