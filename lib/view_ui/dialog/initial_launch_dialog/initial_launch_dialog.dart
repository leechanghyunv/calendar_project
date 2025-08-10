import 'package:calendar_project_240727/base_consumer.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../model/formz_model.dart';
import '../../../repository/formz/formz_model.dart';
import '../../screen/user_statistics_screen/component/auth_modal_component.dart';
import '../dialog_text.dart';
import 'intro_text.dart';

class InitialLaunchDialog extends HookConsumerWidget {
  const InitialLaunchDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    ref.contractForm;

    final formzRefNot = ref.formzWatch;
    final formzRefRead = ref.formzRead;

    ref.listen(formzValidatorProvider, (pre, cur) {
      if (cur.status == FormzStatus.submissionSuccess) {
        Navigator.of(context).pop();
      }
    });


    return AlertDialog(
      title: TextWidget(Platform.isAndroid ? '워크캘린더 시작하기' : '🎉 워크캘린더 시작하기',
          16, width),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Colors.grey.shade200
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,horizontal: 12.0,
              ),
              child: initialText(height),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text('아래 버튼으로 근로조건 등록을 진행해주세요',
                textScaler: TextScaler.noScaling,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Spacer(),
              TextButton(
                  onPressed: () {
                    showBasicModal(context,false);
                  },
                  child: ButtonTextWidget('빠른시작',15, color: Colors.black)
                /// 설문제외 -> 빠른시작 으로 변경
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  showBasicModal(context,true);
                },
                /// 설문포함 -> 설문도 함께하기 로 변경
                child: ButtonTextWidget('시작하기',15),
              ),
            ],
          ),
        ),



      ],
    );
  }
}






