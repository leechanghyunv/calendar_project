import 'package:calendar_project_240727/view_model/filted_source_model.dart';
import 'package:calendar_project_240727/view_ui/minor_issue/default/default_chart_box.dart';
import 'package:calendar_project_240727/core/export_package.dart';

import '../../core/utils/converter.dart';
import '../../core/widget/text_style_util.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../../view_model/contract_model.dart';
import '../../view_model/history_model.dart';
import '../minor_issue/default/default_chart_with_numeric_box.dart';
import '../minor_issue/widget/pie_chart_frame.dart';


class ChartWidget extends ConsumerWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeManager = ref.watch(timeManagerProvider);
    final selected = timeManager.selected;
    final numericSource = ref.watch(numericSourceModelProvider(selected));
    /// historyProvider의 인스턴스를 편집한 결과임
    final state = ref.watch(numericSourceModelProvider(selected).notifier);
    final firstContract = ref.watch(viewContractProvider);
    final history = ref.watch(viewHistoryProvider);
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    return CartBox(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: numericSource.when(
                data: (val) {
                  if (val.contract.isEmpty || state.totalPaynMonth == 0.0) {
                    return pieChartStatisticsNull(true);
                  }
                  return pieChartStatistics(
                      state.normalPercent,
                      state.extendPercent,
                      state.nightPercent,
                      state.extraPercent,
                      state.offPercent);
                },
                error: (err, trace) => pieChartStatistics(
                    state.normalPercent,
                    state.extendPercent,
                    state.nightPercent,
                    state.extraPercent,
                    state.offPercent),
                loading: () => pieChartStatistics(0,0,0,0,0)),
          ),
          Flexible(
            flex: 1,
            child: firstContract.when(
                data: (val) {
                  final numericValue = ref.watch(numericSourceModelProvider(selected).notifier);
                  final reactiveHeight1 = Platform.isAndroid ? 2.5.w : appHeight < 700 ? 0.w : 5.w;
                  /// reactiveHeight1은 두번쨰 블럭의 첫문단
                  final reactiveHeight2 = Platform.isAndroid ? 7.5.w :  15.0.w; /// 10.0 왜 프로맥스와 플러스는 스팩이 같은데 차이가 날까
                  /// reactiveHeight2은 첫번째 블럭의 마지막 문단 아래
                  final monthRecord = state.workRecodenMonth;
                  final month = monthRecord.toStringAsFixed(1);
                  final payRecord = state.totalPaynMonth;
                  final afterTax = state.afterTaxMonth;
                  final dot1 = state.normalDay == 0 ? 1 : 0;
                  final dot2 = state.extendDay == 0 ? 1 : 0;
                  final dot3 = state.nightDay == 0 ? 1 : 0;


                  return PieChartNumericTextBox(
                    children: [
                      Row(

                        children: [
                          Text(
                            formatBigAmount(payRecord,appHeight),
                            style: chartNormalStyle8(appHeight,appWidth),
                          ),
                          payRecord == 0
                              ? SizedBox()
                              :
                          SizedBox(),
                        ],
                      ),

                      SizedBox(height: appHeight > 900 ? 7.5.w : reactiveHeight1),

                      history.when(
                          data: (val) {
                            final subsidy = state.subsidy;
                            final subsidyMonth = state.totolSubsidyDaynMonth;
                            final total = subsidyMonth + afterTax.toInt();

                            final subText = total == 0 ? '일비 포함되지 않습니다' :  '일비는 포함되지 않습니다';
                            double letterSpacingValue = [10, 11, 12].contains(selected.month) ? 1.0 : 0.5;
                            
                            return Container(
                              child: Column(
                                children: [
                                  RichText(
                                    softWrap: false,
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: '${selected.month}월 공수 ',
                                        style: chartTextStyle(appHeight,appWidth),
                                    ),
                                    TextSpan(
                                        text: monthRecord.isNaN ? '' : '$month공수',
                                        style: chartStyle2(Colors.blue,appWidth)),
                                        TextSpan(
                                            text: ' 달성 \n',
                                            style: chartTextStyle(appHeight,appWidth)),

                                    TextSpan(
                                        text: payRecord.isNaN
                                            ? ''
                                            : '급여는 ${formatAmount(payRecord)} 기록\n',
                                        style: chartNormalStyle5(appHeight,appWidth).copyWith(
                                            letterSpacing: afterTax.toInt() == 0 ? 1.25 : afterTax.toInt() < 1000000 ? letterSpacingValue : 0.85,
                                        )),


                                        TextSpan(
                                            text: subsidy == 0 ? '' : '세후급여 ${formatAmount(afterTax.toInt())} 기록\n',
                                            style: chartTextStyle(appHeight,appWidth)),

                                    TextSpan(
                                        text: subsidy == 0 ? '세후급여 ' : '일비포함 ',
                                        style: chartTextStyle(appHeight,appWidth)),
                                    TextSpan(
                                      text: subsidyMonth == 0.0
                                          ? afterTax.isNaN
                                              ? ''
                                              : '${formatAmount(afterTax.toInt())}'
                                          : '${formatAmount(total)}',
                                      style: chartStyle2(Colors.red,appWidth),
                                    ),
                                    TextSpan(
                                        text: subsidy == 0 ? ' 달성\n' : ' 달성',
                                        style: chartTextStyle(appHeight,appWidth)),

                                        TextSpan(
                                            text: subsidy == 0
                                                ? subText
                                                : null,
                                            style: chartTextStyle(appHeight,appWidth).
                                            copyWith(
                                                letterSpacing:
                                                total > 100000
                                                    ? (total > 1000000 ? 0.35 : -0.25)
                                                    : 0),
                                        ),
                                  ]),
                                  ),
                                  SizedBox(height: appWidth > 500 ? 5.0.w : reactiveHeight2),
                                ],
                              ),
                            );
                          },
                          error: (err, trace) => SizedBox(),
                          loading: () => SizedBox(),
                      ),
                      Row(
                        children: [
                          RichText(
                            softWrap: false,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${state.workDaynMonth}일 출근',
                                  style: chartNormalStyle7(appHeight,appWidth),
                                ),
                                TextSpan(
                                    text: state.offDay == 0
                                        ? '  0일 휴일'
                                        : '  ${state.offDay.toInt()}일 휴일',
                                    style: chartNormalStyle9(appWidth),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: appHeight > 900 ? 7.5.w : reactiveHeight1),
                      /// final reactiveHeight1 = Platform.isAndroid ? 1.w : appHeight < 700 ? 0.w : 5.w;
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: RichText(
                                softWrap: false,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                    '주간 ${state.normalDay}일 ${(state.normalPercent.isNaN
                                        ? 0.0
                                        : state.normalPercent).toStringAsFixed(dot1)}% ${formatPayInt(state.normalPay)}\n',
                                    style: chartNormalStyle3(appHeight,appWidth),
                                  ),
                                  /// /// /// ////// /// /// ////// /// /// ////// /// /// ////// /// /// ///
                                  TextSpan(
                                      text: '연장 ',
                                      style:
                                      chartNormalStyle(Colors.black, appHeight,appWidth)),
                                  TextSpan(
                                    text: '${state.extendDay}일',
                                    style: chartNormalStyle4( appHeight,appWidth),
                                  ),
                                  TextSpan(
                                    text:
                                    ' ${(state.extendPercent.isNaN ? 0.0 : state.extendPercent).toStringAsFixed(dot2)}% ${formatPayInt(state.extendPay)}\n',
                                    style: chartNormalStyle3(appHeight,appWidth),
                                  ),
                                  /// /// /// ////// /// /// ////// /// /// ////// /// /// ////// /// /// ///
                                  TextSpan(
                                      text:
                                      '야간 ${state.nightDay}일 ${(state.nightPercent.isNaN ? 0.0 : state.nightPercent).toStringAsFixed(dot3)}% ',
                                      style: chartNormalStyle3(appHeight,appWidth)),
                                  TextSpan(
                                    text:
                                    formatPayInt(state.nightPay),
                                    style: chartNormalStyle2(appHeight,appWidth),
                                  ),

                                ])),
                          ),

                        ],
                      ),


                    ],
                  );
                },
                error: (err, trace) => const SizedBox(),
                loading: () => const SizedBox()),
          ),
        ],
      ),
    );
  }
}
