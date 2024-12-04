import 'package:calendar_project_240727/firebase_analytics.dart';
import 'package:calendar_project_240727/repository/formz/formz_decimal.dart';
import 'package:calendar_project_240727/repository/formz/formz_memo.dart';
import 'package:calendar_project_240727/repository/sqlite/sqlite_history_database.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/work_history_model.dart';


import 'contract_model.dart';

part 'history_model.g.dart';

@riverpod
Future<List<WorkHistory>> viewHistory (ViewHistoryRef ref) async {
  final db = await ref.watch(workhistoryManagerProvider.future);
  return db.getAllWorkHistories();
}

@riverpod
Future<void> addAllHistory(AddAllHistoryRef ref, List<WorkHistory> list) async {
  final db = await ref.watch(workhistoryManagerProvider.future);
  db.insertOrOverwriteWorkHistories(list);
}

@riverpod
Future<void> addHistory (
    AddHistoryRef ref, int pay, DateTime date) async {
  final db = await ref.watch(workhistoryManagerProvider.future);
  final contract = ref.watch(viewContractProvider);
  final addCustom = ref.watch(formzDecimalValidatorProvider);
  final recode = addCustom.decimalData.value.decimal;
  final memoNote = ref.watch(formzMemoValidatorProvider.notifier).value;
  final Map<String,dynamic> event = {};
  late WorkHistory history;
  contract.when(data: (val) {
    if(pay == contract.value!.last.normal){
      history = WorkHistory(
          date: date,
          comment: '정상근무', /// 파란
          pay: contract.value!.last.normal,
          colorCode: '2196F3',
          record: 1.0,
          memo: memoNote,
      );
    }else if(pay == contract.value!.last.extend){
      history = WorkHistory(
          date: date,
          comment: '연장근무',
          pay: contract.value!.last.extend,
          colorCode: 'FCAF50', /// 노란
          record: 1.5,
          memo: memoNote
      );
    }else if(pay == contract.value!.last.night){
      history = WorkHistory(
          date: date,
          comment: '야간근무', /// 빨강
          pay: contract.value!.last.night,
          colorCode: 'F44336',
          record: 2.0,
          memo: memoNote
      );
    } else if(pay == 0){
      history = WorkHistory(
        date: date,
        comment: '휴무',
        pay: pay,  // 기본값 혹은 예외 처리
        colorCode: '4CAF50', /// 그린 4CAF50
        record: 0.0,
        memo: memoNote,
      );
    }else {
      history = WorkHistory(
        date: date,
        comment: '기타근무',
        pay: pay,  // 기본값 혹은 예외 처리
        colorCode: 'AB47BC',  /// 퍼플 9C27B0.shade900 / AB47BC
        record: recode,
        memo: memoNote,
      );
    }
  },
      error: (err,trace) => print(err.toString()),
      loading: () => print('loading....'));

  event.addAll({
    'recode' : history.record,
    'pay' : history.pay,
    'comment' : history.comment,
    'date': DateFormat('yyyy-MM-dd').format(history.date),
    'memo' : history.memo,
  });

  ref.read(firebaseAnalyticsClassProvider.notifier).dailyEvent(
      event);

  return db.insertOrUpdateWorkHistory(history);

}

@riverpod
Future<void> deleteHistory (DeleteHistoryRef ref,DateTime time) async {
  final db = await ref.watch(workhistoryManagerProvider.future);
  return db.deleteWorkHistory(time);
}

@riverpod
Future<void> deleteMonthHistory (DeleteMonthHistoryRef ref,DateTime time) async {
  final db = await ref.watch(workhistoryManagerProvider.future);

  return db.deleteWorkHistoryByMonth(time);
}

@riverpod
Future<void> clearHistory(ClearHistoryRef ref) async {
  final db = await ref.watch(workhistoryManagerProvider.future);

  return db.clearWorkHistory();
}
