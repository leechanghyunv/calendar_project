
import 'package:calendar_project_240727/data/entities/pay_statistics.dart';
import 'package:calendar_project_240727/view_ui/screen/user_statistics_screen/component/user_info_box.dart';

import '../../../../core/export_package.dart';
import '../../../../data/usecases/supabase_provider.dart';

import '../provider/selected_site_provider.dart';


class StatisticsBox extends HookConsumerWidget {
  const StatisticsBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final statsAsync = ref.watch(payStatsNotifierProvider);
    final selectedSite = ref.watch(selectedSiteProvider); // ✅ 선택된 사이트
    final ElectricStats = ref.watch(electricJobStatsNotifierProvider);

    final  value = statsAsync
        .whenData((d) => d).value ?? PayStatistics();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: UserInfoBox(
                name: '평균 일당',
                unit: '만원',
                value: _formatPay(value.average.toInt()),
                text: '평균에서 2만원 이상 차이 난다면 조공 이라도 평균이하의 근로조건입니다.',
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: UserInfoBox(
                name: '전기 평균',
                unit: '만원',
                value: _formatPay(value.electricAverage.toInt()),
                text: '${selectedSite} 주요공종인 전기 공종의 평균일당은 ${_formatPay(value.electricAverage.toInt())}만원입니다',
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: UserInfoBox(
                name: '덕트 평균',
                unit: '만원',
                value: _formatPay(value.ductAverage.toInt()),
                text: '${selectedSite} 주요공종인 덕트 공종의 평균일당은 ${_formatPay(value.ductAverage.toInt())}만원입니다',
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: UserInfoBox(
                name: '배관 평균',
                unit: '만원',
                value: _formatPay(value.pipeAverage.toInt()),
                text: '${selectedSite} 주요공종인 배관 공종의 평균일당은 ${_formatPay(value.pipeAverage.toInt())}만원입니다',
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: UserInfoBox(
                name: '비계 평균',
                unit: '만원',
                value: _formatPay(value.scaffoldAverage.toInt()),
                text: '${selectedSite} 주요공종인 비계 공종의 평균일당은 ${_formatPay(value.scaffoldAverage.toInt())}만원입니다',
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: UserInfoBox(
                name: '칸막이 평균',
                unit: '만원',
                value: _formatPay(value.partitionAverage.toInt()),
                text: '${selectedSite} 주요공종인 칸막이 공종의 평균일당은 ${_formatPay(value.partitionAverage.toInt())}만원입니다',
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: UserInfoBox(
                name: '설비 평균',
                unit: '만원',
                value: _formatPay(value.facilityAverage.toInt()),
                text: '${selectedSite} 주요공종인 설비 공종의 평균일당은 ${_formatPay(value.facilityAverage.toInt())}만원입니다',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: UserInfoBox(
                name: '용접 평균',
                unit: '만원',
                value: _formatPay(value.weldingAverage.toInt()),
                text: '${selectedSite} 주요공종인 용접 공종의 평균일당은 ${_formatPay(value.weldingAverage.toInt())}만원입니다',
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

      ],
    );


  }

  String _formatPay(int? raw) {
    if (raw == null || raw <= 0) return '00';
    return (raw / 10000).toStringAsFixed(1);
  }

}
