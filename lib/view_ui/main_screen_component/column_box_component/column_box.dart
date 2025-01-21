import 'package:calendar_project_240727/base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../repository/time/calculate_day.dart';
import '../../../view_model/filted_source_model.dart';
import '../../../view_model/instance_provider_model/work_day_provider.dart';
import 'indicator_box.dart';


/// SharedPreferences

class ColumnReactiveBox extends ConsumerStatefulWidget {
  const ColumnReactiveBox({super.key});

  @override
  ConsumerState<ColumnReactiveBox> createState() => _ColumnReactiveBoxState();
}

class _ColumnReactiveBoxState extends ConsumerState<ColumnReactiveBox> {


  int workDayValue = 0;
  int extraDayValue = 0;

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final boxHeight = appWidth > 400 ? 80.0 : appWidth < 376 ? 65.0 : 72.5;
    ref.watch(numericSourceModelProvider(ref.selected));
    final extraDay = ref.watch(calculateValueProvider);

    final workDay = ref.watch(workDayProvider);

    workDay.when(data: (val) => setState(() => workDayValue = val),
        error: (err,trace){}, loading: (){});


    double clampedPercentage = (workDayValue/180).clamp(0.0, 1.0);
    final wrd = workDayValue + extraDay; /// (Work Days Reported)
    final severancePay = (wrd * 6200)/10000; /// 퇴직금 공제액
    final total = wrd/252 * 100;
    final getrate = (total * 100).clamp(0.0, 100);
    final percentage = (workDayValue/180 * 100);
    final percent = (percentage > 100 ? 100 : percentage).toStringAsFixed(0);

    String text1 = '퇴직공제금은 ${severancePay.toStringAsFixed(0)}만원, 신청자격일수 252일 중 ${getrate.toStringAsFixed(0)}% 달성';
    String text2 = '근로일수는 ${workDayValue.toStringAsFixed(0)}일, 실업급여 조건 ${percent}% 달성';


    return Column(
      children: [
        buildStatsBox(
          width: appWidth * 0.4,
          height: boxHeight,
          title: '근로신고일수',
          value: '$wrd/252',
          progress: (wrd/252).clamp(0.0, 1.0),
          progressColor: Colors.green,
          description: text1,
        ),
        appWidth < 380 ? SizedBox(height: 5) : SizedBox(height: 10),
        buildStatsBox(
          width: appWidth * 0.4,
          height: boxHeight,
          title: '누적 근로일수',
          value: '${workDayValue}/180',
          progress: clampedPercentage,
          progressColor: Colors.blue,
          description: text2,
        ),
      ],
    );
  }
}
