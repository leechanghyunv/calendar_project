import 'package:calendar_project_240727/data/entities/pay_statistics.dart';

import '../../../../core/export_package.dart';
import '../../../../data/usecases/supabase_provider.dart';
import '../../statistic_screen/component/info_box.dart';

class StatisticsBox extends HookConsumerWidget {
  const StatisticsBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final statsAsync = ref.watch(payStatsNotifierProvider);

    final  value = statsAsync
        .whenData((d) => d).value ?? PayStatistics();



    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoBox(
                name: '평균 일당',
                unit: '만원',
                value: _formatPay(value.average.toInt()),
                text: '평균일당에서 2만원 이상 차이 난다면 처음이라고 해도 아쉬운 금액입니다.',
                /// '일반공종과 비교해서 신호수,안전,화재감시 일당이 평균적으로 낮습니다',
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: InfoBox(
                name: '최대값',
                unit: '만원',
                value: _formatPay(value.maximum),
                text: '일반적으로 일당이 높은 공종은 공기가 짧거나 위험부담이 큰 공종입니다',
              ),
            ),
          ],
        ),

        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoBox(
                name: '최소값',
                unit: '만원',
                value: _formatPay(value.minimum),
                text: '특히 일반현장에서 최대값, 최소값의 차이가 가장 크게 나타났습니다',
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: InfoBox(
                name: '세율',
                unit: '%',
                value: '3.3',
                text: '3.3%의 비율이 가장 많습니다. 이외 나머지는 10% 내외로 받습니다',
              ),
            ),
          ],
        ),
      ],
    );


  }

  String _formatPay(int? raw) {
    if (raw == null || raw <= 0) return '00';
    return (raw / 10000).toStringAsFixed(1);
  }

}
