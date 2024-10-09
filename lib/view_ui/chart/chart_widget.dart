import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_model/filted_source_model.dart';
import 'package:calendar_project_240727/view_ui/minor_issue/default/default_chart_box.dart';
import 'package:calendar_project_240727/core/export.dart';

import '../../core/utils/converter.dart';
import '../../core/widget/text_style_util.dart';
import '../../repository/calendar_time_controll.dart';
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
    double ratio = MediaQuery.of(context).size.aspectRatio;

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
                    return pieChartStatistics(ratio,appWidth,appHeight, 0, 0, 0, 0, 0);
                  }
                  return pieChartStatistics(
                      ratio,appWidth,appHeight,
                      state.normalPercent,
                      state.extendPercent,
                      state.nightPercent,
                      state.extraPercent,
                      state.offPercent);
                },
                error: (err, trace) => pieChartStatistics(
                    ratio,appWidth,appHeight,
                    state.normalPercent,
                    state.extendPercent,
                    state.nightPercent,
                    state.extraPercent,
                    state.offPercent),
                loading: () => pieChartStatistics(ratio,appWidth,appHeight, 0, 0, 0, 0, 0)),
          ),
          Flexible(
            flex: 1,
            child: firstContract.when(
                data: (val) {
                  final monthRecord = state.workRecodenMonth;
                  final month = monthRecord.toStringAsFixed(1);
                  final payRecord = state.totalPaynMonth;
                  final afterTax = state.afterTaxMonth;
                  return PieChartNumericTextBox(
                    children: [
                      Text(
                        formatAmount(payRecord),
                        style: TextStyle(
                          fontSize:
                          appHeight < 700
                                  ? appWidth > 500 ? 12.sp : 24.sp
                                  : appWidth > 500 ? 13.5.sp : 27.sp,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),

                      SizedBox(height: 5.h),
                      history.when(
                          data: (val) {
                            final subsidy = state.subsidy;
                            final subsidyMonth = state.totolSubsidyDaynMonth;
                            final total = subsidyMonth + afterTax.toInt();
                            return Container(
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '${selected.month}월 공수 ',
                                    style: chartTextStyle(ratio,appWidth)),
                                TextSpan(
                                    text: monthRecord.isNaN ? '' : '$month공수',
                                    style: chartStyle2(Colors.blue,appWidth)),
                                    TextSpan(
                                        text: ' 달성 \n',
                                        style: chartTextStyle(ratio,appWidth)),
                                TextSpan(
                                    text: payRecord.isNaN
                                        ? ''
                                        : '급여는 ${formatAmount(payRecord)} 기록\n',
                                    style: TextStyle(
                                        fontSize: appHeight < 700
                                            ? appWidth > 500 ? 6.75.sp : 13.5.sp
                                            : appWidth > 500 ? 7.sp : 14.sp,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.2,
                                        color: Colors.black)),

                                    TextSpan(
                                        text: subsidy == 0 ? '' : '세후 ${formatAmount(afterTax.toInt())}, ',
                                        style: chartTextStyle(ratio,appWidth)),

                                TextSpan(
                                    text: subsidy == 0 ? '세후 ' : '일비 포함 ',
                                    style: chartTextStyle(ratio,appWidth)),
                                TextSpan(
                                  text: subsidyMonth == 0.0
                                      ? afterTax.isNaN
                                          ? ''
                                          : ' ${formatAmount(afterTax.toInt())} '
                                      : ' ${formatAmount(total)}',
                                  style: chartStyle2(Colors.red,appWidth),
                                ),
                                TextSpan(
                                    text: '입니다.',
                                    style: chartTextStyle(ratio,appWidth)),
                              ])),

                            );
                          },
                          error: (err, trace) => Container(
                                // height: 70.sp,
                                // width: 160.sp,
                            child: Text('근무등록을 하시면 ${selected.month}월 공수가 입력됩니다. 세전 금액과 세후 금액을 확인하실 수 있습니다.',
                              style: TextStyle(
                                  fontSize: appWidth > 500
                                      ? 6.5.sp
                                      : 13.sp,
                                  fontWeight: FontWeight.bold,color: Colors.grey[900],
                              letterSpacing: 0.5),
                            ),
                              ),
                          loading: () => SizedBox(
                                height: 70.sp,
                                width: 160.sp,
                              child: Text('근무등록을 하시면 ${selected.month}월 공수가 입력됩니다. 세전 금액과 세후 금액을 확인하실 수 있습니다.',
                            style: TextStyle(
                                fontSize:
                                appWidth > 500 ? 6.5.sp : 13.sp,
                                fontWeight: FontWeight.bold,color: Colors.grey[900],
                                letterSpacing: 0.5),
                          ),
                              ),
                      ),



                      SizedBox(height: appWidth > 500? 2.5.w : 5.w),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${state.workDaynMonth}일 출근',
                                  style: TextStyle(
                                      fontSize: appHeight < 700
                                          ? appWidth > 500 ? 9.sp : 18.sp
                                          : appWidth > 500 ? 10.sp : 20.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      letterSpacing: 1.0),
                                ),
                                TextSpan(
                                    text: state.offDay == 0
                                        ? '  0일 휴일'
                                        : '  ${state.offDay.toInt()}일 휴일',
                                    style: TextStyle(
                                        color: Colors.green.shade700,
                                        fontSize: appWidth > 500 ? 6.5.sp : 13.sp,
                                        // letterSpacing: 0.5,
                                        fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: appWidth > 500? 2.5.w : 5.w),
                      history.when(
                        data: (val) =>
                            Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text:
                                      '주간 ${state.normalDay}일 ${(state.normalPercent.isNaN
                                          ? 0.0
                                          : state.normalPercent).toStringAsFixed(0)}% ${formatPayInt(state.normalPay)}\n',
                                      style: TextStyle(
                                          fontSize: appHeight < 700
                                              ? appWidth > 500 ? 6.5.sp : 13.sp
                                              : appWidth > 500 ? 6.75.sp : 13.5.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(
                                      text: '연장 ',
                                      style:
                                      chartNormalStyle(Colors.black, ratio,appWidth)),
                                  TextSpan(
                                    text: '${state.extendDay}일',
                                    style: TextStyle(
                                        fontSize: appHeight < 700
                                            ? appWidth > 500 ? 7.25.sp : 14.5.sp
                                            : appWidth > 500 ? 7.5.sp : 15.sp,
                                        color: Colors.amber[900], fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(
                                      text:
                                      ' ${(state.extendPercent.isNaN ? 0.0 : state.extendPercent).toStringAsFixed(0)}% ${formatPayInt(state.extendPay)}\n',
                                      style: TextStyle(
                                          fontSize: appHeight < 700
                                              ? appWidth > 500 ? 6.5.sp : 13.sp
                                              : appWidth > 500 ? 6.75.sp : 13.5.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900),
                                  ),

                                  TextSpan(
                                      text:
                                      '야간 ${state.nightDay}일 ${(state.nightPercent.isNaN ? 0.0 : state.nightPercent).toStringAsFixed(0)}% ',
                                      style: chartNormalStyle(Colors.black,ratio,appWidth)),
                                  TextSpan(
                                      text:
                                      formatPayInt(state.nightPay),
                                      style: TextStyle(
                                          fontSize: appHeight < 700
                                              ? appWidth > 500 ? 6.5.sp : 13.sp
                                              : appWidth > 500 ? 7.sp : 14.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900)),

                                ])),
                          ),

                        ],
                      ),
                        error: (err,trace) => Container(
                        alignment: Alignment.centerLeft,
                        child: TextWidget2(
                            '공수별 데이터를 보여드립니다.\nex) 1공수 42% 120만원',
                            appWidth > 500 ? 6.5.sp : 12.sp,
                            Colors.grey.shade800,appWidth),

                      ), loading: () => Container(
                        alignment: Alignment.center,
                      ),
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
