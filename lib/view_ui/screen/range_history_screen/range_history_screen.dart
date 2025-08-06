import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/range_default_screen.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/info_box.dart';
import '../../../core/export_package.dart';
import '../../calendar_rangefield/date_picker_2.dart';
import 'component/buttom_chip_list.dart';
import 'component/range_info_box.dart';

class RangeHistoryScreen extends ConsumerWidget {

  final VoidCallback? onBack;

  const RangeHistoryScreen(this.onBack, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return RangeDefaultScreen(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          /// Navigator.of(context, rootNavigator: true).pop(),
          children: [
            SizedBox(width: 2.5),
            Container(
              width: 3.5,
              height: 20,
              color: Colors.green,
            ),
            SizedBox(width: 5),
            Text(
              '2025년 09월 ~ 2024년 09월',
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                shadows: Platform.isAndroid
                    ? [
                  Shadow(
                    blurRadius: 0.75,
                    color: Colors.grey,
                    offset: Offset(0.25, 0.25),
                  ),
                ]
                    : null,
                fontSize: switch (width) {
                  > 450 => 18,
                  > 420 => 17,
                  _ => 15,
                },
                fontWeight: FontWeight.w800,
              ),
            ),

            Spacer(),
            DateRangeButton(),
          ],
        ),
        SizedBox(height: 25),
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
              BottomManagerChip(),
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
              SizedBox(height: 22.5),
              TextWidget('반장님 근로기간 부터 설정해주세요',16,width),
              SizedBox(height: 2.5),
              TextWidget('기본 데이터는 24년 08월달 기록입니다.',13.5,width),
            ],
          ),
        ),
      ],
    );
  }
}
