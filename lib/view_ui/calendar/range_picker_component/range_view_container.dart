import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/repository/time/calculate_ranged_day.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';
import 'package:calendar_project_240727/view_model/range_filted_model.dart';
import 'package:calendar_project_240727/view_ui/calendar/range_picker_component/range_view_container_frame.dart';
import '../../../core/utils/converter.dart';
import 'build_info_row.dart';

class RangeViewContainer extends ConsumerWidget {
  const RangeViewContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final timeRange = ref.watch(timeRangeManagerProvider.notifier);
    final extraDay = ref
        .watch(calculatedRangeProvider(timeRange.startDate, timeRange.endDate));

    final rangeValue = ref.read(
        rangeFiltedSourceModelProvider(timeRange.startDate, timeRange.endDate)
            .notifier);

    final rangeState = ref.watch(
        rangeFiltedSourceModelProvider(timeRange.startDate, timeRange.endDate));

    int wrd = rangeValue.workDayRange + extraDay;
    final severancePay = (wrd * 6200) / 10000;

    /// 퇴직금 공제액

    final totalValue = formatAmount(rangeValue.totalPayRange);
    final totalAfter = formatAmount(rangeValue.afterTaxTotal.toInt());
    final record = rangeValue.workRecodeRange.toStringAsFixed(1);

    return rangeState.when(
      data: (val) {
        return ContainerBox(
          children: [
            ContainerComponent(
              value: totalValue,
            ),
            BuildInfoRow(
              taxRate: '${rangeValue.tax}%',
              afterPay: '${totalAfter}',
              record: '${record}공수',
              recordDay: '${wrd}일',
              day: '${rangeValue.workDayRange}일',
              retire: '${severancePay}만원',
            ),
          ],
        );
      },
      error: (err, trace) {
        return ContainerBox(
          children: [
            ContainerComponent(
              value: '0',
            ),
            BuildInfoRow(
              taxRate: '0%',
              afterPay: '0',
              record: '${0}공수',
              recordDay: '${0}일',
              day: '${0}일',
              retire: '${0}만원',
            ),
          ],
        );
      },
      loading: () {
        return SizedBox();
      },
    );
  }
}

class taxSettingBox extends StatefulWidget {
  const taxSettingBox({super.key});

  @override
  State<taxSettingBox> createState() => _taxSettingBoxState();
}

class _taxSettingBoxState extends State<taxSettingBox> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            // showDialog(
            //     context: context, builder: (context) => taxSettingDialog());
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey.shade300 : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: Colors.black, width: isSelected ? 0.5 : 0.75),
              ),
              child: Text(
                ' 세율조정 ',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class MiddleTitle extends StatelessWidget {
  const MiddleTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 4.0, 0.0, 4.0),
      child: Row(
        children: [
          Text(
            '누적금액',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey.shade800,
              fontSize: appWidth > 400 ? 14 : 12,
            ),
          ),
          const Spacer(),
          Icon(Icons.more_vert, color: Colors.grey.shade700, size: 20),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
