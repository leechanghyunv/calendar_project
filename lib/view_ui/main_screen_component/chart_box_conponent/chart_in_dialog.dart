import 'package:calendar_project_240727/base_consumer.dart';

import '../../../core/export_package.dart';
import '../../../core/utils/converter.dart';
import '../../../view_model/filted_source_model.dart';

class ChartInDialog extends ConsumerStatefulWidget {
  const ChartInDialog({super.key});

  @override
  ConsumerState<ChartInDialog> createState() => _ChartInDialogState();
}

class _ChartInDialogState extends ConsumerState<ChartInDialog> {

  bool selected = false;

  TextStyle get chartInStyle  => TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: Colors.grey.shade800,
  );

  TextStyle get chartSmallStyle  => TextStyle(
    fontSize: 9.5,
    fontWeight: FontWeight.w600,
    color: Colors.grey.shade400,
  );

  Widget chartInText(String text){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(text,style: chartInStyle),
    );
  }

  Widget chartInSmall(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Text(text,style: chartSmallStyle.copyWith(color: Colors.grey.shade700)),
    );
  }

  Widget chartInSmall2(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Text(text,style: chartSmallStyle.copyWith(
          color: Colors.grey.shade700,fontWeight: FontWeight.w900)),
    );
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(numericSourceModelProvider(ref.selected).notifier);

    return GestureDetector(
      onTap: (){
        setState(() {
          selected = !selected;
        });

      },
      child: PopupMenuButton(
        color: Colors.grey.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        offset: const Offset(20, -180),
          itemBuilder: (context) => [
            PopupMenuItem(
              enabled: false,
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ref.contract.when(data: (val){
                  if (val.isEmpty) {
                    return const SizedBox(); // 또는 다른 기본 위젯 반환
                  }

                  final normal = formatAmount(val.last.normal);
                  final dayPay = val.last.subsidy;
                  final dayPayMonth = formatAmount(ref.numericSource.totolSubsidyDaynMonth);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      chartInText('근로수당: $normal'),
                      Row(
                        children: [
                          chartInSmall(dayPay == 0 ? '일비는 미포함 되었습니다' : '일비 ${formatAmount(dayPay)}'),
                          chartInSmall2(dayPay == 0 ?  '':'${ref.month}월 ${dayPayMonth}'),


                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ],
                  );
                },
                    error: (err,trace) => SizedBox(),
                    loading: () => SizedBox(),
                ),

              ),
            ),
            PopupMenuItem(
              enabled: false,
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.shade100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      chartInText('🚀 주간 ${state.normalDay}일 ${formatPayInt(state.normalPay)}'),
                      chartInText('🔥 연장 ${state.extendDay}일 ${formatPayInt(state.extendPay)}'),
                      chartInText('🎉 야간 ${state.nightDay}일 ${formatPayInt(state.nightPay)}'),
                    ],
                  ),

                ),
            ),
          ],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,

          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
            child: Icon(
              size: selected ? 22.5 : 25.5,
              Icons.more_horiz,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),




    );
  }
}
