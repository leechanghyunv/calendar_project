import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/decimal_textfield_frame.dart';
import '../../core/widget/text_widget.dart';
import '../../core/widget/toast_msg.dart';
import '../../model/formz_decimal_model.dart';
import '../../repository/calendar_time_controll.dart';
import '../../repository/formz_decimal.dart';
import '../../view_model/calendar_event_model.dart';
import 'decimal_textfield.dart';

class DecimalDialog extends ConsumerStatefulWidget {
  const DecimalDialog({super.key});

  @override
  ConsumerState<DecimalDialog> createState() => _DecimalDialogState();
}

class _DecimalDialogState extends ConsumerState<DecimalDialog> {

  bool isStateEmpty = true;


  @override
  Widget build(BuildContext context) {
    final formzState = ref.watch(formzDecimalValidatorProvider);
    final formzRefNot = ref.watch(formzDecimalValidatorProvider.notifier);
    final formzRefread = ref.read(formzDecimalValidatorProvider.notifier);
    final date = ref.watch(timeManagerProvider).selected;

    ref.listen(formzDecimalValidatorProvider, (pre,cur) async {
      if (cur.status == DecimalFormzStatus.submissionSuccess) {
        Future.delayed(const Duration(seconds: 0), () {
          ref.refresh(calendarEventProvider(date));
          ref.read(timeManagerProvider.notifier).selectedNextDay();
          Navigator.pushReplacementNamed(context, '/main');
        });
      }
    });


    Widget textBox() => Padding(
        padding: const EdgeInsets.all(9.5),
        child: Container(
          child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: '일',
                      style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold)),
                  const TextSpan(text: '당은 소수점에 맞게 계산해서 저장합니다. ',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                  const TextSpan(text: '숫자 0 입력시 휴무처리합니다. ',
                      style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                  const TextSpan(text: '입력 후 ',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),

                  TextSpan(text: '확인 ',
                      style: TextStyle(color: isStateEmpty
                          ? Colors.grey.shade700
                          : Colors.purple.shade900,
                          fontSize: 18,fontWeight: FontWeight.w900)),

                  const TextSpan(text: '아이콘을 눌러주세요',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                ],
              )),
        )
    );

    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextWidget(
            '공수를 숫자로 입력해주세요',15.5),
      ),
      content: SizedBox(
        height: 220,
        child: Column(
          children: [
            textBox(),
            const SizedBox(height: 10),
            frameBox(
              Row(
                children: [
                  TextWidget2(
                      formzRefNot.decimalError,
                      12, Colors.purple.shade900),
                ],
              ),
              DecimalTextfield(
                onChanged: (val){
                  final decimalValue = double.tryParse(val) ?? 0.0;
                  setState(() => isStateEmpty = val.isEmpty);
                  formzRefread.onChangeDecimal(decimalValue);
                },
                iconOnPressed: isStateEmpty
                    ? null
                    : (){
                  formzRefread.onSubmit();
                },
                iconColor: isStateEmpty
                    ? Colors.grey.shade700
                    : Colors.purple.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
