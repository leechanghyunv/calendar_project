import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/work_history_model.dart';
import '../filted_source_model.dart';

part 'chart_value_provider.g.dart';

@riverpod
Future<double> lineValue(LineValueRef ref,DateTime month) async {



  List<WorkHistory> filteredHistory = [];


  final numeric = await ref.watch(numericSourceModelProvider(month).future);

  final startDate = DateTime(month.year, month.month, 1);
  final endDate = DateTime(month.year, month.month + 1, 1).subtract(const Duration(seconds: 1));

   filteredHistory = numeric.history.where((item) {
    return item.date.isAfter(startDate) && item.date.isBefore(endDate);
  }).toList();

  final monthRecord = filteredHistory.fold(0.0, (p, e) => p + e.record);

  return monthRecord;
}
