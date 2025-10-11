import 'dart:core';

import 'package:calendar_project_240727/repository/sqlite/sqlite_contract_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../model/contract_model.dart';
part 'contract_model.g.dart';


@Riverpod(keepAlive: true)
Future<List<LabourCondition>> viewContract(ViewContractRef ref) async {

  final db = await ref.read(labourConditionManagerProvider.future);

  return db.getAllLabourConditions();
}

@riverpod
Future<void> addContract(AddContractRef ref,LabourCondition condition) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  db.insertLabourCondition(condition);
  ref.invalidate(viewContractProvider);
}

@riverpod
Future<void> updateContract(UpdateContractRef ref, int goal) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  db.updateLastLabourConditionGoal(goal);
  await Future.delayed(const Duration(milliseconds: 200));
  ref.invalidate(viewContractProvider);
}


@riverpod
Future<void> updateSubsidy(UpdateSubsidyRef ref,int newSubsidy) async {
  final db = await ref.read(labourConditionManagerProvider.future);
  await db.updateLastLabourConditionSubsidy(newSubsidy);
  await Future.delayed(const Duration(milliseconds: 200));
  ref.invalidateSelf();
}

@riverpod
Future<void> clearContract(ClearContractRef ref,LabourCondition condition) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  await Future.delayed(const Duration(milliseconds: 200));
   db.truncateLabourCondition();
  ref.invalidate(viewContractProvider);
}