import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/theme_color.dart';
import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../main_screen_component/column_box_component/indicator_box.dart';
import '../auth_screen/component/auth_text.dart';
import '../statistic_screen/component/function_chip.dart';
import 'component/auth_modal_component.dart';
import 'component/statistics_filter_chip.dart';
import 'component/statistics_box.dart';
import 'component/statistics_total_ratio.dart';

class UserStatisticsScreen extends HookConsumerWidget {
  const UserStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final nestedScrollController = useScrollController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Center(
          child: NestedScrollView(
            controller: nestedScrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height > 750 ? Column(
                          children: [
                            Row(
                              children: [
                                bigText('근로조건 설정',height),
                                Spacer(),

                              ],
                            ),
                            SizedBox(height: 1.5),
                            Row(
                              children: [
                                smallText('설문 자료가 쌓이면 양질의 정보가 제공될 수 있습니다.',height),
                                Spacer(),
                              ],
                            ),
                          ],
                        ) : SizedBox.shrink(),

                        SizedBox(height: height > 750 ? 10 : 10),
                        Container(
                          height: height > 800 ? 190 : 180,
                          width: MediaQuery.of(context).size.width,
                          decoration: UserSettingBoxDecoration,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    AnimatedEmoji(
                                      AnimatedEmojis.wave.mediumLight,
                                      repeat: false,
                                      animate: true,
                                      size: width > 400 ? 18 : 17,
                                    ),
                                    SizedBox(width: 5),
                                    TextWidget('안녕하세요 워크캘린더입니다.',15,width),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                                  child: introText(height),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    /// 근로조건 설정하기
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          showBasicModal(context,false);
                                        },
                                        child: Container(
                                          height: 35,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Colors.green.shade700,
                                              width: 1.0,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 5,
                                                offset: const Offset(2, 5),
                                              ),
                                            ],
                                          ),
                                          child: TextWidget(
                                              '근로조건 설정하기', 15, width,
                                              color: Colors.grey.shade100),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Material(
                                //       color: Colors.transparent,
                                //       child: InkWell(
                                //         onTap: () {
                                //           showBasicModal(context,false);
                                //         },
                                //         borderRadius: BorderRadius.circular(4),
                                //         child: Padding(
                                //           padding: EdgeInsets.all(2), // 원하는 크기로 조정
                                //           child:  Text('설문없이 설정하기',
                                //             style: TextStyle(
                                //               fontSize: Platform.isAndroid ? 15.0 : 14.0,
                                //               height: textHeight,
                                //               fontWeight: FontWeight.bold,
                                //               color: Colors.grey,
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     Spacer(),
                                //     FunctionChip(
                                //       label: '근로조건 설정하기',
                                //       color: Colors.grey.shade300,
                                //       borderColor: Colors.grey.shade600,
                                //       textColor: Colors.grey.shade900,
                                //       onTap: () {
                                //         showBasicModal(context,true);
                                //       },
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(height: height > 750 ? 15: 15),

                      ],
                    ),
                  )
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // StatisticsTotalRatio(),
                    SizedBox(height: height > 750 ? 20 : 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width < 370 ? 2.5 : 4.0),
                      child: StatisticsFilterChip(
                        nestedScrollController

                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                          vertical: height > 750 ? 3.0 : 0.0, horizontal: 8.0),
                      child: Divider(color: Colors.grey.shade300, thickness: 1.0),
                    ),
                    SizedBox(height: 5),
                    StatisticsBox(),
                
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
