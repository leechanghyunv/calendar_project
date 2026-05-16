import 'dart:core';

import 'package:calendar_project_240727/repository/sqlite/sqlite_contract_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/export_package.dart';
import '../../model/contract_model.dart';
part 'contract_model.g.dart';


@Riverpod(keepAlive: true)
Future<List<LabourCondition>> viewContract(Ref ref) async {

  final db = await ref.read(labourConditionManagerProvider.future);

  return db.getAllLabourConditions();
}

@riverpod
Future<void> addContract(Ref ref,LabourCondition condition) async {
  final db = await ref.watch(labourConditionManagerProvider.future);

  db.insertLabourCondition(condition);
  ref.invalidate(viewContractProvider);

}

@riverpod
Future<void> updateContract(Ref ref, int goal) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  db.updateLastLabourConditionGoal(goal);
  await Future.delayed(const Duration(milliseconds: 200));
  ref.invalidate(viewContractProvider);
}

@riverpod
Future<void> toggleOrAdd(ref,String site,int pay,int subsidy,double tax) async {

  final db = await ref.read(labourConditionManagerProvider.future);

  final conditions = await ref.read(viewContractProvider.future);
  final exists = conditions.any((e) => e.site == site && e.normal == pay);

  if (!exists) {

    final last = conditions.isEmpty ? null : conditions.last;

    final newCondition = LabourCondition(
      date: DateTime.now(),
      goal: last?.goal ?? 0,
      normal: pay,
      extend: (pay * 1.5).toInt(),
      night: (pay * 2.0).toInt(),
      tax: tax,
      subsidy: subsidy,
      site: site,
      job: last?.job ?? '',
    );
    await ref.read(addContractProvider(newCondition).future);
  } else {
    final target = conditions.firstWhere((e) => e.site == site && e.normal == pay);
    final updated = <LabourCondition>[
      ...conditions.where((e) => !(e.site == site && e.normal == pay)),
      target,
    ];
    await db.updateOrder(updated);
    ref.invalidate(viewContractProvider);
  }
}




@riverpod
Future<void> updateSubsidy(Ref ref,int newSubsidy) async {
  final db = await ref.read(labourConditionManagerProvider.future);
  await db.updateLastLabourConditionSubsidy(newSubsidy);
  await Future.delayed(const Duration(milliseconds: 200));
  ref.invalidate(viewContractProvider);
}

@riverpod
Future<void> clearContract(Ref ref,LabourCondition condition) async {
  final db = await ref.watch(labourConditionManagerProvider.future);
  await Future.delayed(const Duration(milliseconds: 200));
   db.truncateLabourCondition();
  ref.invalidate(viewContractProvider);
}