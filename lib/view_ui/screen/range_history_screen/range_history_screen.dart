
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/range_default_screen.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/info_box.dart';
import '../../../core/export_package.dart';
import '../../../view_model/filted_instance_model/range_filted_model.dart';
import 'component/buttom_chip_list.dart';
import 'component/range_info_box.dart';

class RangeHistoryScreen extends ConsumerWidget {

  const RangeHistoryScreen( {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final dateRange = ref.watch(timeRangeManagerProvider);

    // ✅ RangeSource를 사용해서 실제 데이터 가져오기
    final rangeData = ref.watch(
        rangeSourceProvider(dateRange.startDate, dateRange.endDate)
    );

    final startMonth = '${dateRange.startDate.year}년 '
        '${dateRange.startDate.month.toString().padLeft(2, '0')}월 '
        '${dateRange.startDate.day.toString().padLeft(2, '0')}일';
    final endMonth = '${dateRange.endDate.year}년 '
        '${dateRange.endDate.month.toString().padLeft(2, '0')}월 '
        '${dateRange.endDate.day.toString().padLeft(2, '0')}일';


    return RangeDefaultScreen(
      isCalendarScreen: false,
      children: [
        BottomManagerChip(),
        SizedBox(height: 7.5),
        Divider(
          color: Colors.grey.shade300,
          thickness: 0.8,
        ),
        SizedBox(height: 7.5),
        Container(
          height: height / 1.7,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: InfoBox(
                        name: '누적금액',
                        unit: '만원',
                        value: '4522',
                        text: '마지막 근로일은 24년 08월 13일입니다. 8월 금액은 223.3만원 입니다'),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: InfoBox(
                        name: '누적공수',
                        unit: '공수',
                        value: '132',
                        text: '반장님의 마지막 근로일은 2025년 08월 29일 입니다'),
                  ),
                ],
              ),
              SizedBox(height: 15),
              RangeInfoBox(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    TextWidget('세후(10.4%)',13.5,width,color: Colors.grey.shade700),
                                    Spacer(),
                                    TextWidget('2332.1만원',13.5,width),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    TextWidget('퇴직공제금액',13.5,width,color: Colors.grey.shade700),
                                    Spacer(),
                                    TextWidget('233.1만원',13.5,width),
                                  ],
                                ),

                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    TextWidget('근로신고일수',13.5,width,color: Colors.grey.shade700),
                                    Spacer(),
                                    TextWidget('233일',13.5,width),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    TextWidget('총 출력일수',13.5,width,color: Colors.grey.shade700),
                                    Spacer(),
                                    TextWidget('233일',13.5,width),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    TextWidget('근로공제일수',13.5,width,color: Colors.grey.shade700),
                                    Spacer(),
                                    TextWidget('332일',13.5,width),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 40),
              TextWidget('${startMonth} ~ ${endMonth}',16,width),
              SizedBox(height: 7.5),
              TextWidget('총 금액 2033만원 에서 20% 달성',14.5,width),
            ],
          ),
        ),
      ],
    );
  }
}
