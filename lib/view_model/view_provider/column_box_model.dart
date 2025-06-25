import '../../model/column_box_value_model.dart';
import '../../repository/repository_import.dart';
import '../../repository/time/calculate_day.dart';
import '../filted_instance_model/filted_source_total.dart';

part 'column_box_model.g.dart';

// 클래스 내부 방식: 위젯이 리빌드될 때마다 모든 계산이 다시 실행됩니다.
// 별도 프로바이더 방식: Riverpod의 의존성 추적으로 입력 데이터가 변경될 때만 재계산이 발생합니다.

@riverpod
ColumnBoxValueModel columnStatistics(ref) {

  final workDay = ref.watch(workRecordProvider).value?.workDay ?? 0;
  final extraDay = ref.watch(calculateValueProvider);

  // print('workDay: ${workDay}, extraDay: $extraDay');

  final wrd = workDay + extraDay;
  final severancePay = (wrd * 6200) / 10000;
  final total = wrd / 252;
  final getRate = (total * 100).clamp(0.0, 100);
  final percentage = (workDay / 180 * 100);
  final percent = (percentage > 100 ? 100 : percentage).toStringAsFixed(0);

  final text1 = '퇴직공제금은 ${severancePay.toStringAsFixed(0)}만원, 신청자격일수 252일 중 ${getRate.toStringAsFixed(0)}% 달성';
  final text2 = '근로일수는 ${workDay.toStringAsFixed(0)}일, 실업급여 조건 ${percent}% 달성';

  return ColumnBoxValueModel(
    workDayValue: workDay,
    extraDay: extraDay,
    wrd: wrd,
    text1: text1,
    text2: text2,
    percentage: percentage,
    wrdProgress: (total).clamp(0.0, 1.0),
    workDayProgress: (workDay / 180).clamp(0.0, 1.0),
  );
}
