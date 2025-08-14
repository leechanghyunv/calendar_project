import 'package:calendar_project_240727/repository/sqlite/sqlite_selected_history_database.dart';
import 'package:calendar_project_240727/view_model/filted_instance_model/range_filted_model.dart';
import '../../core/utils/converter.dart';
import '../../model/selected_history_model.dart';
import '../../repository/repository_import.dart';

part 'selected_model.g.dart';


@riverpod
Future<List<SelectedHistory>> viewSelectedHistory(
    ViewSelectedHistoryRef ref) async {
final db = await ref.watch(selectedHistoryManagerProvider.future);
  return db.getSelectedHistories();
}


@riverpod
Future<void> addSelected(
    AddSelectedRef ref,
    DateTime start,
    DateTime end,
    double tax,
    String memo,
    String job) async {

  final utcStart = DateTime.utc(start.year, start.month, start.day);
  final utcEnd = DateTime.utc(end.year, end.month, end.day);
  await ref.watch(rangeSourceProvider(utcStart, utcEnd).future);
  final rangeValue = ref.read(rangeSourceProvider(utcStart,utcEnd).notifier);

  try{
    final db = await ref.watch(selectedHistoryManagerProvider.future);

    final record = rangeValue.workRecodeRange;
    final pay = rangeValue.totalPayRange;
    final int durationValue = calculateMonthDifference(utcStart, utcEnd);

    final selectedHistory = SelectedHistory(
      startDate: utcStart,
      endDate: utcEnd,
      duration: durationValue,
      memo: memo,
      money: pay.toDouble(),
      afterTax: pay.toDouble() * (1 - tax),
      record: record,
      job: job
    );

    await db.insertSelectedHistory(selectedHistory);
    ref.invalidate(viewSelectedHistoryProvider);
    ref.invalidate(rangeSourceProvider(utcStart, utcEnd)); // 기존 코드 유지
  }catch(e,stack){
    print('⛔ addSelected 에러: $e');
    print(stack);
  }

}

@riverpod
Future<void> deleteSelectedHistory(ClearSelectedHistoryRef ref,int index) async {
  final db = await ref.watch(selectedHistoryManagerProvider.future);
  ref.invalidate(viewSelectedHistoryProvider);
  return db.deleteSelectedHistory(index);
}



@riverpod
Future<void> clearSelectedHistory(ClearSelectedHistoryRef ref) async {
  final db = await ref.watch(selectedHistoryManagerProvider.future);
  ref.invalidate(viewSelectedHistoryProvider);
  return db.clearSelectedHistory();
}

@riverpod
Future<void> deleteOldSelectedHistoryDatabase(ClearSelectedHistoryRef ref) async {
  final db = await ref.watch(selectedHistoryManagerProvider.future);
  ref.invalidate(viewSelectedHistoryProvider);
  return db.deleteOldDatabase();
}