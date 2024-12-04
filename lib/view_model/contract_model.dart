
import 'dart:core';

import 'package:calendar_project_240727/repository/sqlite/sqlite_contract_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/contract_model.dart';

part 'contract_model.g.dart';


@riverpod
class SortedContract extends _$SortedContract {

  int? get normal => state.value?.normal ?? 0;
  int? get extend => state.value?.extend ??  0;
  int? get night => state.value?.night ?? 0;
  int? get goal => state.value?.goal ?? 0;

  DateTime nowDate = DateTime.now().toUtc();

  LabourCondition labourCondition = LabourCondition(date: DateTime.now().toUtc());

  @override
  FutureOr<LabourCondition> build() async {
    final list = ref.watch(viewContractProvider);
    return list.when(
        data: (val) => LabourCondition(
            date: state.value?.date ?? nowDate,
        normal: normal ?? 0,
        extend: extend ?? 0,
        night: night ?? 0,
        ),
        error: (err,trace) => LabourCondition(date: nowDate),
        loading: () => LabourCondition(date: nowDate));
  }

  Future<void> getLatestContract(LabourCondition condition) async {
    labourCondition = LabourCondition(
        date: condition.date,
        normal: condition.normal,
        extend: condition.extend,
        night: condition.night,
    );
  }

  Future<LabourCondition> seeLatestContract() async {
    return labourCondition;
  }
}

@Riverpod(keepAlive: true)
Future<List<LabourCondition>> viewContract(ViewContractRef ref) async {

  final db = await ref.read(labourConditionManagerProvider.future);

  return db.getAllLabourConditions();
}

@riverpod
Future<void> addContract(AddContractRef ref,LabourCondition condition) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  ref.invalidate(viewContractProvider);
  ref.invalidate(sortedContractProvider);
  return db.insertLabourCondition(condition);
}

@riverpod
Future<void> clearContract(ClearContractRef ref,LabourCondition condition) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  await Future.delayed(const Duration(milliseconds: 200));
  return db.truncateLabourCondition();
}