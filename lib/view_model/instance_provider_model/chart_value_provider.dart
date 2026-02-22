import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/export_package.dart';
import '../filted_instance_model/filted_month_model.dart';

part 'chart_value_provider.g.dart';

@riverpod
Future<double> lineValue(Ref ref, DateTime month) async {

  final asyncData = ref.watch(monthRecordProvider(month));

  final monthRecord = await asyncData.maybeWhen(
      data: (val) {
        final workRecordString = val.workRecord; // 예: '10.0공수'
        final numericWorkRecord = double.tryParse(workRecordString.split('공수')[0]) ?? 0.0;
        return numericWorkRecord;
      },
      orElse: () => 0.0);

  return monthRecord;
}
