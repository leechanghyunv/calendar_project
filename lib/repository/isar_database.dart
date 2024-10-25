

import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path_provider/path_provider.dart';
import '../core/utils/converter.dart';
import '../core/widget/toast_msg.dart';
import '../model/contract_model.dart';
import '../model/work_history_model.dart';

part 'isar_database.g.dart';

@Riverpod(keepAlive: true)
Future<IsarDatabase> isarManager(IsarManagerRef ref) async {
  final isar = await ref.watch(initIsarProvider.future);
  return IsarDatabase(isar);
}

@Riverpod(keepAlive: true)
Future<Isar> initIsar(InitIsarRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [LabourConditionSchema, WorkHistorySchema],
    directory: dir.path,
  );
}


class IsarDatabase {
  final Isar isar;

  IsarDatabase(this.isar);

  Future<List<LabourCondition>> getContract() async {
    try{
      final contract = isar.labourConditions.where().findAllSync();
      return contract;
    }catch(e){
      print('getContract: ${e.toString()}');
    }
    throw const FormatException('getContract');
  }

  Future<void> addAllContract(List<LabourCondition> list) async {
    try{
      print('addAllContract: $list');
      isar.writeTxn(() async {
        await isar.labourConditions.putAll(list);
      });
    }catch(e){
      print('addAllContract: ${e.toString()}');
    }
  }

  Future<void> addContract(LabourCondition condition) async {
    try{
      print('addContract: $condition');
      isar.writeTxn(() async {
        await isar.labourConditions.put(condition);
      });
    }catch(e){
      print('addContract: ${e.toString()}');
    }
  }

  Future<void> clearContract() async {
    try{
      isar.writeTxn(() async {
        await isar.labourConditions.clear();
      });
    }catch(e){
      print('clearContract: ${e.toString()}');
    }
  }

  Future<List<WorkHistory>> getHistory() async {
    try{
      final history = await isar.workHistorys.where().findAll();
      return history;
    }catch(e){
      print('getHistory: ${e.toString()}');
    }
    throw NoDataFoundException();
  }

  Future<void> addHistory(WorkHistory contract) async {
    print('addHistory ');
    try{
      isar.writeTxn(() async {
        await isar.workHistorys.put(contract);
      });
    }catch(e){
      print('addHistory: ${e.toString()}');
    }
  }

  Future<void> addAllHistory(List<WorkHistory> contracts) async {
    print('addAllHistory');
    try {
      await isar.writeTxn(() async {
        await isar.workHistorys.putAll(contracts); // List 형태의 WorkHistory 객체 저장
      });
    } catch (e) {
      print('addAllHistory: ${e.toString()}');
    }
  }

  Future<void> deleteHistory(DateTime time) async {

    try{
      await isar.writeTxn(() async {
        await isar.workHistorys.deleteByIndex('date', [time]);
      });
    }catch(e){
      print('deleteHistory: ${e.toString()}');
    }
  }

  Future<void> deleteMonthHistory(DateTime month) async {
    final startOfMonth = DateTime(month.year, month.month, 1);
    final endOfMonth = DateTime(month.year, month.month + 1, 0);
    try {
      await isar.writeTxn(() async {
        await isar.workHistorys.filter().dateBetween(
            startOfMonth,
            endOfMonth,
        ).deleteAll();
      });
    } catch (e) {
      print('deleteMonthHistory: ${e.toString()}');
    }
  }

  Future<void> clearHistory() async {

    try{
      await isar.writeTxn(() async {
        await isar.workHistorys.clear();
      });
    }catch(e){
      print('deleteHistory: ${e.toString()}');
    }
  }

/// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///

  Future<Map<DateTime, List<WorkHistory>>> calendarHistory() async {
    Map<DateTime, List<WorkHistory>> mappedData = {};
    Map< DateTime, List<WorkHistory>> filtedData = {};
   /// print('GetcalendarHistory');
    try{
      final filted = await isar.workHistorys.where().findAll();
      mappedData = convertToMap(filted);
      mappedData.forEach((key,value){
        List<WorkHistory> newDataList = [];
        for(var e in value){
          WorkHistory newData = WorkHistory(
            date: e.date.toUtc(),
            pay: e.pay,
            record: e.record,
            colorCode: e.colorCode,
            comment: e.comment,
            memo: e.memo,
          );
          newDataList.add(newData);
        }
        filtedData[key.toUtc()] = newDataList;
      });
      return filtedData;
    }catch(e){
      Exception(e.toString());
    }
    return filtedData;
  }


}

class NoDataFoundException implements Exception {
  final String message;

  NoDataFoundException([this.message = 'No data found']);

  @override
  String toString() => 'NoDataFoundException: $message';
}