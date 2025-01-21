
import 'dart:core';

import 'package:calendar_project_240727/repository/sqlite/sqlite_contract_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/contract_model.dart';

part 'contract_model.g.dart';


@Riverpod(keepAlive: true)
Future<List<LabourCondition>> viewContract(ViewContractRef ref) async {

  final db = await ref.read(labourConditionManagerProvider.future);

  return db.getAllLabourConditions();
}

@riverpod
Future<void> addContract(AddContractRef ref,LabourCondition condition) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  ref.invalidate(viewContractProvider);
  return db.insertLabourCondition(condition);
}

@riverpod
Future<void> updateContract(UpdateContractRef ref, int goal) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  return db.updateLastLabourConditionGoal(goal);
}

@riverpod
Future<void> clearContract(ClearContractRef ref,LabourCondition condition) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  await Future.delayed(const Duration(milliseconds: 200));
  return db.truncateLabourCondition();
}