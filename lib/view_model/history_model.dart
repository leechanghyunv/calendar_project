
import 'package:calendar_project_240727/repository/formz_decimal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/work_history_model.dart';
import '../repository/isar_database.dart';
import 'contract_model.dart';

part 'history_model.g.dart';

@riverpod
Future<List<WorkHistory>> viewHistory (ViewHistoryRef ref) async {
  final isar = await ref.watch(isarManagerProvider.future);

  return isar.getHistory();
}

@riverpod
Future<void> addHistory (
    AddHistoryRef ref, int pay, DateTime date) async {
  final isar = await ref.watch(isarManagerProvider.future);
  final contract = await ref.watch(viewContractProvider);
  final addCustom = ref.watch(formzDecimalValidatorProvider);

  final recode = addCustom.decimalData.value.decimal;

  late WorkHistory history;
  contract.when(data: (val) {
    if(pay == contract.value!.last.normal){
      history = WorkHistory(
          date: date,
          comment: '정상근무', /// 파란
          pay: contract.value!.last.normal,
          colorCode: '2196F3',
          record: 1.0);
    }else if(pay == contract.value!.last.extend){
      history = WorkHistory(
          date: date,
          comment: '연장근무',
          pay: contract.value!.last.extend,
          colorCode: 'FCAF50', /// 노란
          record: 1.5);
    }else if(pay == contract.value!.last.night){
      history = WorkHistory(
          date: date,
          comment: '야간근무', /// 빨강
          pay: contract.value!.last.night,
          colorCode: 'F44336',
          record: 2.0);
    } else if(pay == 0){
      history = WorkHistory(
        date: date,
        comment: '휴무',
        pay: pay,  // 기본값 혹은 예외 처리
        colorCode: '4CAF50', /// 그린 4CAF50
        record: 0.0,
      );
    }else {
      history = WorkHistory(
        date: date,
        comment: '기타근무',
        pay: pay,  // 기본값 혹은 예외 처리
        colorCode: 'AB47BC',  /// 퍼플 9C27B0.shade900 / AB47BC
        record: recode,
      );
    };
  },
      error: (err,trace) => print(err.toString()),
      loading: () => print('loading....'));
  return isar.addHistory(history,date);
}





@riverpod
Future<void> deleteHistory (DeleteHistoryRef ref,DateTime time) async {
  final isar = await ref.watch(isarManagerProvider.future);
  return isar.deleteHistory(time);
}
