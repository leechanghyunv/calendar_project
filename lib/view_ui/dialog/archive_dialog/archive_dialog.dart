import 'package:calendar_project_240727/base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../core/utils/converter.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../repository/time/calculate_day.dart';
import '../../../theme_color.dart';
import '../../../view_model/contract_model.dart';
import '../../../view_model/filted_source_model.dart';
import '../../../view_model/history_model.dart';
import 'achive_container.dart';

class ArchiveDialog extends ConsumerWidget {
  const ArchiveDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final labelStyle = TextStyle(
      height: textHeight,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.grey.shade800,
    );

    // 데이터 항목 위젯
    Widget _buildDataRow(String label, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: labelStyle),
          Spacer(),
          Text(value, style: labelStyle),
        ],
      );
    }



    final state =  ref.watch(numericSourceModelProvider(ref.selected));
    final contract = ref.watch(viewContractProvider);
    final goalValue = formatAmountGoal(contract.value?.last.goal ?? 0);

    final extraDay = ref.watch(calculateValueProvider);
    final workDay =ref.workDay.isNaN ? 0 : ref.workDay;

    final wrd = workDay + extraDay; /// (Work Days Reported)
    final severancePay = (wrd * 6200)/10000; /// 퇴직금 공제액
    final totalPay = ref.numericSource.totalPay;
    final total = ref.numericSource.afterTaxTotal;
    final totalValue = formatDecimalAmountforSmall(totalPay.toDouble());
    final totalAfter = formatDecimalAmountforSmall(total);

    return AlertDialog(
      backgroundColor: Colors.grey.shade50,
      title: Row(
        children: [
          Text('누적기록 관리',style: TextStyle(
            // color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          ),
          Spacer(),
        ],
      ),
      content: SizedBox(
        height: 300,
        child: Column(
          children: [
            AchiveContainer(goalValue: goalValue, goalRate: ref.goalRateAfterTax),
            SizedBox(height: 5),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    _buildDataRow('누적금액','${totalValue}'),
                    SizedBox(height: 12),
                    _buildDataRow('잔여공수','${ref.remainingGoalAfterTax}공수'),
                    SizedBox(height: 12),
                    _buildDataRow('세후기준(${ref.contract.value?.last.tax}%)','${totalAfter}'),
                    SizedBox(height: 12),
                    _buildDataRow('출력일수','${ref.workDay}일'),
                    SizedBox(height: 12),
                    _buildDataRow('근로공제금액','${severancePay}만원'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),


      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                onPressed: (){
                  customMsg('데이터를 모두 삭제합니다');
                  ref.read(clearHistoryProvider);
                  Future.delayed(const Duration(milliseconds: 250),(){
                    ref.refreshState(context);
                  });

                },
                child: Text('모든기록삭제',
                  style: TextStyle(fontWeight: FontWeight.w900,color: Colors.grey.shade500),
                ),
              ),
              Spacer(),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('나가기',
                    style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black),
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
