
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';
import 'package:calendar_project_240727/view_model/filted_instance_model/search_source_model.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/provider/show_memo_history_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/range_default_screen.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/info_box.dart';
import 'component/buttom_chip_list.dart';
import 'component/history_memo_component.dart';
import 'component/range_info_box.dart';

class RangeHistoryScreen extends HookConsumerWidget {

  const RangeHistoryScreen( {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final dateRange = ref.watch(timeRangeManagerProvider);
    final state = ref.watch(searchSourceModelProvider);
    final showMemo = ref.watch(showMemoHistoryStateProvider);
    final historyMemoController = useTextEditingController();
    final historyMemoFocus = useFocusNode();

    final startMonth = '${dateRange.startDate.year}년 '
        '${dateRange.startDate.month.toString().padLeft(2, '0')}월 '
        '${dateRange.startDate.day.toString().padLeft(2, '0')}일';
    final endMonth = '${dateRange.endDate.year}년 '
        '${dateRange.endDate.month.toString().padLeft(2, '0')}월 '
        '${dateRange.endDate.day.toString().padLeft(2, '0')}일';

    return switch (state) {
      AsyncData(:final value) => RangeDefaultScreen(
        isCalendarScreen: false,
        children: [
          BottomManagerChip(),
          height > 750 ? SizedBox(height: 7.5) : SizedBox(height: 2.5),
          Divider(
            color: Colors.grey.shade300,
            thickness: 0.8,
          ),
          height > 750 ? SizedBox(height: 7.5) : SizedBox(height: 2.5),
          Container(
            // height: height > 750 ? height / 1.7 : height / 1.5,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: InfoBox(
                            name: '누적금액',
                            unit: '만원',
                            value: '${(value.total/10000).toStringAsFixed(1)}',
                            text: '마지막 근로일은 24년 08월 13일입니다. 8월 금액은 223.3만원 입니다'),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: InfoBox(
                            name: '누적공수',
                            unit: '공수',
                            value: '${(value.record).toStringAsFixed(1)}',
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
                                        TextWidget('세후(${value.tax}%)',13.5,width,color: Colors.grey.shade700),
                                        Spacer(),
                                        TextWidget(
                                            '${(value.afterTax/10000).toStringAsFixed(1)}만원',
                                            13.5,width),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        TextWidget('퇴직공제금액',13.5,width,color: Colors.grey.shade700),
                                        Spacer(),
                                        TextWidget('${(value.severancePay).toStringAsFixed(1)}만원',13.5,width),
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
                                        TextWidget('${value.workDay}일',13.5,width),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        TextWidget('근로공제일수',13.5,width,color: Colors.grey.shade700),
                                        Spacer(),
                                        TextWidget('${value.wrd}일',13.5,width),
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
                  SizedBox(height: 15),
                  HistoryMemoComponent(
                    startMonth,
                    endMonth,
                    historyMemoFocus,
                    historyMemoController,
                    (value) {
                    },
                  ),
              
                ],
              ),
            ),
          ),
        ],
      ),

      AsyncLoading() => Container(
        height: height / 1.7,
        alignment: Alignment.center,
        child: TextWidget('loading...', 15, width),
      ),

    // 🔥 로딩이 아니고 데이터도 없으면 모두 에러로 처리
      _ => Container(
        height: height / 1.7,
        alignment: Alignment.center,
        child: TextWidget('데이터를 불러올 수 없습니다', 15, width),
      ),
  };
  }
}
