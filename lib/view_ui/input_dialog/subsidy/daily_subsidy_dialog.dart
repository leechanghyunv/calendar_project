import 'package:calendar_project_240727/core/widget/decimal_textfield_frame.dart';
import 'package:calendar_project_240727/repository/calendar_time_controll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/widget/text_widget.dart';
import '../../../model/formz_model.dart';
import '../../../repository/formz_model.dart';
import 'daily_subsidy_textfield.dart';

class DailySubsidyDialog extends ConsumerWidget {
  const DailySubsidyDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final formzRef = ref.watch(formzValidatorProvider);
    final formzRefNot = ref.watch(formzValidatorProvider.notifier);
    final formzRefread = ref.read(formzValidatorProvider.notifier);
    final timeManager = ref.watch(timeManagerProvider);
    final selected = timeManager.selected;

    ref.listen(formzValidatorProvider, (pre,cur){
      if(cur.status == FormzStatus.submissionSuccess){
        Navigator.pushReplacementNamed(context, '/main');
      }
    });

    const String displayErrorText = '일비가 없으시다면 바로 좌측 아이콘을 눌러주세요';

    Widget textBox() => Padding(
        padding: const EdgeInsets.all(9.5),
        child: Container(
          child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: '일비를 모두 입력해주시면 아이콘이 활성화됩니다. ',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                  const TextSpan(text: '입력 후 우측',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                   TextSpan(text: ' 아이콘',
                      style: TextStyle(color: Colors.green.shade700,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                  const TextSpan(text: '을 눌러주세요. ',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                  const TextSpan(text: '일비가 없으시다면 따로 입력하지 마시고 바로',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                  const TextSpan(text: ' 아이콘',
                      style: TextStyle(color: Colors.red,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                  const TextSpan(text: '을 눌러주세요.',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                ],
              )),
        )
    );


    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            TextWidget(
                '일비를 입력해주세요',15.5),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  12.0),
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black, size: 20),
            ),
          ],
        ),
      ),
      content: SizedBox(
        height: 240,
        child: Column(
          children: [
            textBox(),
            const SizedBox(height: 15),
            frameBox(
              Row(
                children: [
                  TextWidget2(
                      formzRefNot.subsidyError,
                      10,
                    Colors.grey.shade700,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  DailySubsidyTextfield(
                    onChanged: (val) => formzRefread.onChangeSubsidy(val),
                    iconOnPressed: () => formzRefread.onSubmitFinal(selected),

                    iconColor: formzRefNot.subsidyError == displayErrorText ? Colors.red.shade300 : Colors.green.shade700,
                    borderColor: formzRefNot.subsidyError == displayErrorText ? Colors.grey.shade700 : Colors.grey.shade700,
                    cursorColor: formzRefNot.subsidyError == displayErrorText ? Colors.grey.shade700 : Colors.green.shade700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
