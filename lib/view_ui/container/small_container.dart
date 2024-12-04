import 'dart:io';

import 'package:calendar_project_240727/view_model/filted_source_model.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/converter.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../../view_model/contract_model.dart';
import '../minor_issue/default/default_small_box.dart';
import 'container_method.dart';
import 'container_text.dart';

class LeftContainer extends ConsumerStatefulWidget {
  const LeftContainer({super.key});

  @override
  ConsumerState<LeftContainer> createState() => _LeftContainerState();
}

class _LeftContainerState extends ConsumerState<LeftContainer> {

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    return Consumer(
        builder: (context, ref, child){
      final contract = ref.watch(viewContractProvider);
      final history = ref.watch(viewHistoryProvider);
      return contract.when(
          data: (val){

            final bottomLefeStyle = TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Platform.isAndroid
              /// 안드로이드의 경우
                  ? appWidth > 500
                  ? (14 - 1.0).sp/2
                  : (appWidth <= 370
                  ? (14 - 1.5).sp
                  : (14 - 1.0).sp)
              /// 안드로이드가 아닐 경우
                  : appWidth > 500
                  ? 7.sp
                  : (appWidth <= 370
                  ? (14 - 2.0).sp
                  : 14.sp),
              color: Colors.black,
            );


            if(val.isEmpty){
              return  DefaultSmallBox(
                child: RichText(
                  softWrap: false,
                    text: TextSpan(
                  children: [
                    TextSpan(text: '근로조건을 입력해주세요.\n'
                      ,style: bottomLefeStyle.copyWith(letterSpacing: 1.5),
                    ),
                    TextSpan(text: '합계,'
                      ,style: bottomLefeStyle.copyWith(color: Colors.red[700],fontWeight: FontWeight.w900),
                    ),
                    TextSpan(text: '누적금액,'
                      ,style: bottomLefeStyle.copyWith(color: Colors.green[700],fontWeight: FontWeight.w900),
                    ),
                    TextSpan(text: '잔여 공수'
                      ,style: bottomLefeStyle.copyWith(color: Colors.blue[700],fontWeight: FontWeight.w900),
                    ),
                    TextSpan(text: ' 들을\n'
                      ,style: bottomLefeStyle,
                    ),
                    TextSpan(text: '세후금액 기준으로 계산 후에 \n자료를 제공해 드립니다 ^^'
                      ,style: bottomLefeStyle,
                    ),
                  ],
                ),
                ),

              );
            }else {
              final goalValue = formatAmountGoal(contract.value?.last.goal ?? 0);
              final timeManager = ref.watch(timeManagerProvider);
              final selected = timeManager.selected;
              final state2 = ref.watch(numericSourceModelProvider(selected));
              final numericValue = ref.watch(numericSourceModelProvider(selected).notifier);
              final total = numericValue.afterTaxTotal;
              final totalAfter = formatDecimalAmountforSmall(total);
              final subsidy = numericValue.subsidy;
              final totalAndsubsidyAfter = formatDecimalAmountforSmall(total);


              String goalRateAfterTax = state2.when(
                data: (val){
                  final dat = numericValue.goalRateAfterTax > 10 ? 2 : 3;
                if(val.history.isEmpty || val.contract.isEmpty){
                  return '0.000';
                }
                return numericValue.goalRateAfterTax >= 100
                    ? '100'
                    : numericValue.goalRateAfterTax.toStringAsFixed(dat);
              }, error: (err,trace) => '', loading: ()=> '',
              );

              String goalRatePlusAfterTax = state2.when(
                data: (val){
                  final dat = numericValue.goalRateAndAfterTax > 10 ? 2 : 3;
                if(val.history.isEmpty || val.contract.isEmpty){
                  return '0.000';
                }
                return numericValue.goalRateAndAfterTax >= 100
                    ? '100'
                    : numericValue.goalRateAndAfterTax.toStringAsFixed(dat);
              }, error: (err,trace) => '', loading: ()=> '',
              );

              String remainingGoalAfterTax = state2.when(data: (val){
                if(val.history.isEmpty || val.contract.isEmpty){
                  return '0.0';
                }
                return int.parse(numericValue.remainingGoalAfterTax)
                    >= 0 ? numericValue.remainingGoalAfterTax
                    : '0';
              }, error: (err,trace) => '', loading: ()=> '',
              );

              String remainingGoalPlusAfterTax = state2.when(data: (val){
                if(val.history.isEmpty || val.contract.isEmpty){
                  return '0.0';
                }
                return int.parse(numericValue.remainingGoalPlusAfterTax)
                    >= 0 ? numericValue.remainingGoalPlusAfterTax
                    : '0';
              }, error: (err,trace) => '', loading: ()=> '',
              );

              bool goalFinished = goalRatePlusAfterTax == '100' && goalRateAfterTax == '100' ? true : false;



              return DefaultSmallBox(
                child: RichText(
                  softWrap: false,
                  text:
                  TextSpan(
                      children: [
                        TextSpan(text: goalValue.toString().length <= 5 ? '목표금액은 ' : '목표금액 ',
                            style: BottomSubStyle()),

                        TextSpan(text: goalValue,
                            style: BottomStyle(
                              letterSpacing: Platform.isAndroid ? 0.5 : 0.25,
                              color:Colors.grey[900],
                              fontWeight: bottomWeight)),

                        TextSpan(text: '입니다.\n',
                            style:BottomSubStyle()),

                        TextSpan(text: subsidy != 0 ? '일비포함' : '누적금액' ,
                            style: BottomSubStyle()),

                        TextSpan(text: subsidy != 0 ? '(세후)' : '(세후)' ,
                            style: BottomSubStyle(fontWeight: FontWeight.w800)),

                        TextSpan(text: subsidy != 0 ? '$totalAndsubsidyAfter\n' : '$totalAfter\n',
                            style: BottomStyle(
                                fontWeight: bottomWeight,

                                letterSpacing: calculateRate(total),

                                color: Colors.black)),

                        TextSpan(text: subsidy != 0 ? '${goalRatePlusAfterTax.toString()}%' : '${goalRateAfterTax.toString()}%',
                            style: BottomSubStyle(
                              fontWeight: FontWeight.w900,
                            ),
                        ),

                        TextSpan(text: goalFinished ? ' 모두 달성 했습니다.\n':'를 달성 했습니다.\n',
                            style: BottomStyle(
                                letterSpacing: Platform.isAndroid? 1.25 : 0.5,
                                color: Colors.black),

                        ),

                        TextSpan(text: remainingGoalPlusAfterTax.length > 3 ? '남은 공수' : '남은 공수는',
                            style: BottomStyle(color: Colors.grey[900])),

                        TextSpan(text: subsidy != 0 ? ' $remainingGoalPlusAfterTax 공수' : ' $remainingGoalAfterTax 공수',
                          style: BottomStyle(
                            color: Colors.red[700],
                            fontWeight: bottomWeight,
                        ),
                        ),
                        TextSpan(text: goalFinished ? ' 입니다.' : '입니다.',
                            style: BottomStyle(
                                letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
                                color: Colors.grey[900])),
                      ]
                  ),
                ),

              );

            }
          },
          error: (err,trace) => DefaultSmallBox(
            child: Text(
              '근로조건을 입력해주세요. 누적금액, 목표금액 대비 남은 공수를 계산해서 보여줍니다.',
              style: BottomStyle(fontWeight: FontWeight.w900,color: Colors.grey[700])
            ),
          ),
          loading: () => const SizedBox());
    });


  }
}
