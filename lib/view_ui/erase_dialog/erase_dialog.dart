import 'package:calendar_project_240727/core/widget/decimal_textfield_frame.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/repository/formz_deletion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/formz_decimal_model.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/calendar_event_model.dart';
import 'deletion_textfield.dart';

class EraseDialog extends ConsumerWidget {
   EraseDialog({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    String errorText = '아이콘이 활성화되었습니다';

    final formzState = ref.watch(formzDeletionValidatorProvider);
    final formzRefNot = ref.watch(formzDeletionValidatorProvider.notifier);
    final formzRefread = ref.read(formzDeletionValidatorProvider.notifier);
    final date = ref.watch(timeManagerProvider).selected;

    ref.listen(formzDeletionValidatorProvider, (pre,cur) async {
      if (cur.status == FormzStatus.submissionSuccess) {
        Future.delayed(const Duration(seconds: 0), () {
          ref.refresh(calendarEventProvider(date));
          ref.read(timeManagerProvider.notifier).selectedNextDay();
        });
      }
    });

    Widget textBox() => Padding(
        padding: const EdgeInsets.all(9.5),
        child: Container(
          child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: "'Delete file'",
                      style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                  const TextSpan(text: '를 직접 입력해주시면 아이콘이 활성화됩니다. 입력 후 우측에',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                  TextSpan(text: ' 삭제 ',
                      style: TextStyle(
                          color: formzRefNot.deletionError == errorText
                          ? Colors.red.shade300
                          : Colors.grey.shade700,
                          fontSize: 18,fontWeight: FontWeight.w900)),

                  const TextSpan(text: '아이콘을 눌러주세요. 모든 공수 데이터가 삭제됩니다.',
                      style: TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.bold,letterSpacing: 1.0)),

                ],
              )),
        )
    );


    return StatefulBuilder(
        builder: (context,setState){
      return AlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextWidget(
              '모두 지우시겠습니까?',15.5),
        ),
        content: SizedBox(
          height: 230,
          child: Column(
            children: [
              textBox(),
              const SizedBox(height: 10),
              frameBox(
                Row(
                  children: [
                    TextWidget2(
                        formzRefNot.deletionError,
                        12, Colors.red.shade300),
                  ],
                ),
                DeletionTextfield(
                  onChanged: (val) =>
                    formzRefread.onChangeDeletion(val),
                  iconOnPressed: formzRefNot.deletionError == errorText
                      ? (){
                    Navigator.pushReplacementNamed(context, '/main');
                    formzRefread.onSubmit();
                  }
                      : null,
                  iconColor: formzRefNot.deletionError == errorText
                      ? Colors.red.shade300
                      : Colors.grey.shade700,
                ),
              ),

            ],
          ),
        ),
      );
    });
  }
}
