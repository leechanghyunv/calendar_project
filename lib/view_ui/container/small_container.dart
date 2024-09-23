import 'package:calendar_project_240727/view_model/filted_source_model.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/converter.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/contract_model.dart';
import '../minor_issue/default/default_small_box.dart';

class LeftContainer extends ConsumerStatefulWidget {
  const LeftContainer({super.key});

  @override
  ConsumerState<LeftContainer> createState() => _LeftContainerState();
}

class _LeftContainerState extends ConsumerState<LeftContainer> {

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;
    final ratio = MediaQuery.of(context).size.aspectRatio;

    TextStyle smallContainerStyle(Color color) => TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: appHeight < 700
            ? 13.5.sp
            : appWidth > 500 ? 7.sp : 14.sp,
        color: color);

    TextStyle bgGray = TextStyle(
        fontSize: appHeight < 700
            ? appWidth > 500 ? 7.sp : 14.sp
            : appWidth > 500 ? 7.sp : 14.sp,
        color: Colors.grey[900]);

    double fontSize =  appHeight < 700
        ? appWidth > 500 ? 7.sp : 14.sp
        : appWidth > 500 ? 7.sp : 14.sp;

    return Consumer(builder: (context, ref, child){
      final contract = ref.watch(viewContractProvider);
      final history = ref.watch(viewHistoryProvider);
      return history.when(
          data: (val){
            if(val.isEmpty){
              return const SizedBox();
            }else {
              final goalValue = formatAmountGoal(contract.value?.last.goal ?? 0);
              final timeManager = ref.watch(timeManagerProvider);
              final selected = timeManager.selected;
              final state2 = ref.watch(numericSourceModelProvider(selected));
              final numericValue = ref.watch(numericSourceModelProvider(selected).notifier);
              final totalPay = formatAmount(numericValue.totalPay);
              final totalAfter = formatDecimalAmount(numericValue.afterTaxTotal);
              final subsidy = numericValue.subsidy;
              final totalAndsubsidyAfter = formatDecimalAmount(numericValue.afterTaxTotalAnd);


              String goalRateAfterTax = state2.when(
                data: (val){
                if(val.history.isEmpty || val.contract.isEmpty){
                  return '0.0';
                }
                return numericValue.goalRateAfterTax >= 100
                    ? '100'
                    : numericValue.goalRateAfterTax.toStringAsFixed(1);
              }, error: (err,trace) => '', loading: ()=> '',
              );

              String goalRatePlusAfterTax = state2.when(
                data: (val){
                if(val.history.isEmpty || val.contract.isEmpty){
                  return '0.0';
                }
                return numericValue.goalRateAndAfterTax >= 100
                    ? '100'
                    : numericValue.goalRateAndAfterTax.toStringAsFixed(1);
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

              return DefaultSmallBox(
                child: RichText(
                  text:
                  TextSpan(
                      children: [
                        TextSpan(text: '목표금액 ',style: bgGray),
                        TextSpan(text: goalValue,style: smallContainerStyle(Colors.grey[900]!)),
                        TextSpan(text: ' 입니다.\n',style:bgGray),

                        TextSpan(text: subsidy != 0 ? '일비포함(세후) ' : '누적금액(세후)' ,style: smallContainerStyle(Colors.grey[900]!)),
                        TextSpan(text: subsidy != 0 ? '$totalAndsubsidyAfter\n' : '$totalAfter\n',style: smallContainerStyle(Colors.grey[900]!)),

                        TextSpan(text:  subsidy != 0 ? '${goalRatePlusAfterTax.toString()}%를 달성 했습니다.\n' : '${goalRateAfterTax.toString()}%를 달성 했습니다.\n',
                            style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w900,fontSize: fontSize,letterSpacing: 0.75)),

                        TextSpan(text: '남은 공수는',
                            style: TextStyle(color: Colors.grey[900],fontSize: fontSize)),

                        TextSpan(text: subsidy != 0 ? ' $remainingGoalPlusAfterTax 공수' : ' $remainingGoalAfterTax 공수',style: TextStyle(
                          color: Colors.red[700], fontWeight: FontWeight.w900, fontSize: fontSize,
                        ),
                        ),
                        TextSpan(text: '입니다.',style: bgGray),
                      ]
                  ),
                ),

              );

            }
          },
          error: (err,trace) => DefaultSmallBox(
            child: Text(
              '근로조건을 입력해주세요. 누적금액, 목표금액 대비 남은 공수를 계산해서 보여줍니다.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: appWidth > 500 ? 7.0.sp : 14.0.sp, color: Colors.grey[700]),

            ),
          ),
          loading: () => const SizedBox());
    });


  }
}
