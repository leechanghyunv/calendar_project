

import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path_provider/path_provider.dart';
import '../core/utils/converter.dart';
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
      print('getHistory ${history.last.date}');
      print('getHistory ${history.last.pay}');
      print('getHistory ${history.last.id}');
      return history;
    }catch(e){
      print('getHistory: ${e.toString()}');
    }
    throw const FormatException('getHistory');
  }

  Future<void> addHistory(WorkHistory contract,DateTime time) async {
    print('addHistory ');
    try{
      isar.writeTxn(() async {
        await isar.workHistorys.put(contract);
      });
    }catch(e){
      print('addHistory: ${e.toString()}');
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

/// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///

  Future<Map<DateTime, List<WorkHistory>>> calendarHistory(DateTime day) async {
    Map<DateTime, List<WorkHistory>> mappedData = {};
    Map< DateTime, List<WorkHistory>> filtedData = {};
    print('GetcalendarHistory');
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

