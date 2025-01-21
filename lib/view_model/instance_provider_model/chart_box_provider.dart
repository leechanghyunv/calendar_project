import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/work_history_model.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../filted_source_model.dart';

part 'chart_box_provider.g.dart';

class MonthlyWorkData {
  final double monthRecord;
  final int workDay;
  final int offDay;

  MonthlyWorkData({
    required this.monthRecord,
    required this.workDay,
    required this.offDay,
  });
}

@riverpod
Future<MonthlyWorkData> workRecode(WorkRecodeRef ref) async {

  List<WorkHistory> filteredHistory = [];

  double monthRecord = 0.0;
  int workDay = 0;
  int offDay = 0;

  final selected = ref.watch(timeManagerProvider).selected;
  final numeric = ref.watch(numericSourceModelProvider(selected));

  final startDate = DateTime(selected.year, selected.month, 1);
  final endDate = DateTime(selected.year, selected.month + 1, 1).subtract(const Duration(seconds: 1));

  numeric.when(data: (val){
    filteredHistory = val.history.where((item) {
      return item.date.isAfter(startDate) && item.date.isBefore(endDate);
    }).toList();

    monthRecord = filteredHistory.fold(0.0,(p,e) => p + e.record);
    workDay = filteredHistory.where((e) => e.record != 0.0).length;
    offDay = filteredHistory.where((e) => e.record == 0.0).length;


  }, error: (err,trace){}, loading: (){});

  return MonthlyWorkData(
    monthRecord: monthRecord,
    workDay: workDay,
    offDay: offDay,
  );
}