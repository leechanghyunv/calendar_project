import 'package:calendar_project_240727/view_model/filted_source_model.dart';
import 'package:calendar_project_240727/view_ui/minor_issue/default/default_chart_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../core/utils/converter.dart';
import '../../core/widget/text_style_util.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/contract_model.dart';
import '../minor_issue/default/default_chart_with_numeric_box.dart';
import '../minor_issue/widget/pie_chart_frame.dart';

class ChartWidget extends ConsumerWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final timeManager = ref.watch(timeManagerProvider);
    final selected = timeManager.selected;
    final numericSource = ref.watch(numericSourceModelProvider(selected));
    /// historyProvider의 인스턴스를 편집한 결과임
    final state = ref.watch(numericSourceModelProvider(selected).notifier);
    final firstContract = ref.watch(viewContractProvider);
    double ratio = MediaQuery.of(context).size.aspectRatio;

    return CartBox(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: numericSource.when(data: (val){
              if(val.contract.isEmpty || val.history.isEmpty){
                return PieChartStatistics(
                    ratio,0,0,0,0,0);
              }
              return PieChartStatistics(
                  ratio,
                  state.normalPercent,
                  state.extendPercent,
                  state.nightPercent,
                  state.extraPercent,
                  state.offPercent);
            },
                error: (err,trace) => PieChartStatistics(
                    ratio,
                    state.normalPercent,
                    state.extendPercent,
                    state.nightPercent,
                    state.extraPercent,
                    state.offPercent
                ),
                 loading: () => SizedBox()),
          ),
          Flexible(
            flex: 1,
              child: firstContract.when(
                  data: (val) {
                    return PieChartNumericTextBox(
                      children: [
                        Text(
                          formatAmount(state.totalPaynMonth),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.aspectRatio > 0.5 ? 24.sp : 27.sp,
                            fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                          ),
                        ),

                        SizedBox(height: 5),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: '${selected.month}월 총 공수는 ',
                                        style: ChartTextStyle(ratio)),
                                    TextSpan(text: state.workRecodenMonth.isNaN ? '' : '${state.workRecodenMonth}공수 ' ,style: ChartStyle2(Colors.blue)),
                                    TextSpan(text: state.totalPaynMonth.isNaN ? '' : '급여는 ${formatAmount(state.totalPaynMonth)}이며 ', style: ChartTextStyle(ratio)),
                                    TextSpan(text: ' 이번달은', style: ChartTextStyle(ratio)),
                                    TextSpan(text: state.afterTaxMonth.isNaN ? '' : ' 세후 ${formatAmount(state.afterTaxMonth.toInt())}', style: ChartStyle2(Colors.red)),
                                    TextSpan(text: ' 입니다.', style: ChartTextStyle(ratio)),
                                  ]
                              )),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                           RichText(
                             text: TextSpan(
                             children: [
                               TextSpan(text: '${state.workDaynMonth}일 출근',
                                 style: TextStyle(
                                   fontSize: MediaQuery.of(context).size.aspectRatio > 0.5 ? 18.sp : 20.sp,
                                   fontWeight: FontWeight.w900,color: Colors.black,
                                   letterSpacing: 1.0),),
                               TextSpan(text: state.offDay == 0 ? '' :  '  ${state.offDay.toInt()}일 휴일',
                                   style: TextStyle(color: Colors.green.shade700,fontSize: 13.sp,fontWeight: FontWeight.w900)),
                             ],
                           ),
                           ),

                          ],
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: DateFormat('M월 근무일수 일 중').format(DateTime.now()),style: ChartTextStyle(ratio)),
                                    TextSpan(text: ' 주간은 ${state.normalDay}일',style: ChartNormalStyle(Colors.black,ratio)),
                                    TextSpan(text: ' ${(state.normalPercent.isNaN ? 0.0 : state.normalPercent).toStringAsFixed(0)}%',style: ChartTextStyle(ratio)),

                                    TextSpan(text: ' 연장은 ${state.extendDay}일',style: ChartNormalStyle(Colors.amber[900]!,ratio)),
                                    TextSpan(text: ' ${(state.extendPercent.isNaN ? 0.0 : state.extendPercent).toStringAsFixed(0)}%',style: ChartTextStyle(ratio)),

                                    TextSpan(text: ' 야간은 ${state.nightDay}일',style: ChartNormalStyle(Colors.black,ratio)),
                                    TextSpan(text: ' ${(state.nightPercent.isNaN ? 0.0 : state.nightPercent).toStringAsFixed(0)}%',style: ChartTextStyle(ratio)),
                                    TextSpan(text: ' 입니다.',style: ChartNormalStyle(Colors.black,ratio)),
                                  ]
                              )),
                        ),

                      ],
                    );
                  },
                  error: (err,trace) => SizedBox(),
                  loading: () => SizedBox()),
          ),

        ],
      ),
    );
  }
}
