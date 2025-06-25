import 'package:flutter_svg/svg.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../main_screen_component/column_box_component/indicator_box.dart';
import '../auth_screen/component/auth_text.dart';
import '../statistic_screen/component/function_chip.dart';
import '../statistic_screen/component/info_box.dart';
import 'component/indicator_info_box.dart';
import 'component/modal_sheet/auth_modal_component.dart';
import 'component/stastics_filter_chip.dart';

class UserStatisticsScreen extends StatelessWidget {
  const UserStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Center(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            bigText('근로조건 설정',height),
                            Spacer(),
                            Icon(
                              Icons.more_vert,
                              size: (width > 400 ? 25.0 : 22.5),
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                        SizedBox(height: 1.5),
                        Row(
                          children: [
                            smallText('설문 자료가 쌓이면 그에 따른 양질의 정보가 제공될 수 있습니다.',height),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          decoration: UserSettingBoxDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/sparkle.svg',
                                      width: switch (width) {
                                        > 450 => 16,
                                        > 420 => 16,
                                        > 400 => 15,
                                        _ => 14,
                                      },
                                      colorFilter: ColorFilter.mode(
                                        Colors.grey.shade700,
                                        BlendMode.srcIn,
                                      ),
                                      clipBehavior: Clip.antiAlias,

                                    ),
                                    SizedBox(width: 5),
                                    TextWidget('안녕하세요 워크캘린더입니다.',15,width),
                                  ],
                                ),
                                Spacer(),
                                introText(height),
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Spacer(),
                                    FunctionChip(
                                      label: '근로조건 설정하기',
                                      color: Colors.grey.shade300,
                                      borderColor: Colors.grey.shade600,
                                      textColor: Colors.grey.shade900,
                                      onTap: () {
                                        showBasicModal(context);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                      ],
                    ),
                  )
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 18.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: '하이테크',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(text: ' 비율은 '),
                          TextSpan(
                            text: '43%',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(text: '로 가장 많습니다.\n'),
                          TextSpan(
                            text: '🔩전기',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(text: '는 '),
                          TextSpan(
                            text: '30.2%',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(
                            text: ' 로 가장 많이 선택된 공종입니다.',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                        ],
                      ),
                    ),


                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: StatisticsFilterChip(),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                          vertical: height > 750 ? 3.0 : 0.0, horizontal: 8.0),
                      child: Divider(color: Colors.grey.shade300, thickness: 1.0),
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InfoBox(
                            // svg: 'party',
                            name: '🔥평균 일당',
                            unit: '만원',
                            value: '16',
                            text: '전기공종을 선택한 가장 많은 유저들이 15.5만원으로 계약하셨습니다.',
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 1,
                          child: InfoBox(
                            // svg: 'party',
                            name: '🎉최대값',
                            unit: '만원',
                            value: '25.5',
                            text: '전기공종을 선택한 가장 많은 유저들이 15.5만원으로 계약하셨습니다.',
                          ),
                        ),
                      ],
                    ),



                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: IndicatorInfoBox(
                            name: '📍최소값',
                            unit: '만원',
                            value: '12.5',
                            text: '전기공종을 선택한 가장 많은 유저들이 15.5만원으로 계약하셨습니다.전기공종을 선택한 가장 많은 유저들이 15.5만원으로 계약하셨습니다.',
                          ),
                        ),

                        SizedBox(width: 10,),
                        Expanded(
                          flex: 1,
                          child: InfoBox(
                            // svg: 'party',
                            name: '🍀일비',
                            unit: '만원',
                            value: '2.5',
                            text: '2.5만원이 일반적입니다. 일비는 식사로 대체되는 경우가 많습니다',
                          ),
                        ),
                      ],
                    ),
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
