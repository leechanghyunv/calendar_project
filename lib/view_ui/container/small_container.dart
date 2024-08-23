import 'package:blinking_text/blinking_text.dart';
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

    TextStyle smallContainerStyle(Color color) => TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: MediaQuery.of(context).size.aspectRatio > 0.5 ? 13.5.sp : 14.sp,
        color: color);

    TextStyle bgGray = TextStyle(
        fontSize: MediaQuery.of(context).size.aspectRatio > 0.5 ? 14.5.sp : 15.sp,
        color: Colors.grey[900]);

    double fontSize =  MediaQuery.of(context).size.aspectRatio > 0.5 ? 13.5.sp : 13.5.sp;

    return Consumer(builder: (context, ref, child){
      final contract = ref.watch(viewContractProvider);
      final history = ref.watch(viewHistoryProvider);
      return history.when(
          data: (val){
            if(val.isEmpty){
              return SizedBox();
            }else {
              final goalValue = formatAmountGoal(contract.value?.last.goal ?? 0);
              final timeManager = ref.watch(timeManagerProvider);
              final selected = timeManager.selected;
              final state2 = ref.watch(numericSourceModelProvider(selected));
              final numericValue = ref.watch(numericSourceModelProvider(selected).notifier);
              final totalPay = formatAmount(numericValue.totalPay);

              String goalRate = state2.when(data: (val){
                if(val.history.isEmpty || val.contract.isEmpty){
                  return '0.0';
                }
                return numericValue.goalRate >= 100
                    ? '100'
                    : numericValue.goalRate.toStringAsFixed(1);
              }, error: (err,trace) => '', loading: ()=> '',
              );

              String remainingGoal = state2.when(data: (val){
                if(val.history.isEmpty || val.contract.isEmpty){
                  return '0.0';
                }
                ///  numericValue.remainingGoal.toString();
                return int.parse(numericValue.remainingGoal)
                    >= 0 ? numericValue.remainingGoal
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
                        TextSpan(text: ' 이며 현재 ',style:bgGray),
                        TextSpan(text: totalPay,style: smallContainerStyle(Colors.grey[900]!)),
                        TextSpan(text: ' 달성 ',style: bgGray),
                        TextSpan(text: ' ${goalRate.toString()}%',
                            style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w900,fontSize: fontSize)),

                        TextSpan(text: '를 달성했습니다. 목표 잔여 공수는',
                            style: TextStyle(color: Colors.grey[900],fontSize: fontSize)),

                        TextSpan(text: ' $remainingGoal공수 ',style: TextStyle(
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
            child: BlinkText(
              '근로조건을 입력해주세요',
              duration: Duration(seconds: 1),
              times: 5,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0.sp, color: Colors.grey[300]),
              endColor: Colors.black,
            ),
          ),
          loading: () => SizedBox());
    });


  }
}
