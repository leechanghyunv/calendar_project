import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_model/contract_model.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../dialog_text.dart';

class GoalSettingDialog extends ConsumerStatefulWidget {

  const GoalSettingDialog({super.key});

  @override
  ConsumerState<GoalSettingDialog> createState() => _GoalSettingDialogState();
}

class _GoalSettingDialogState extends ConsumerState<GoalSettingDialog> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;
    final contractValue = ref.contract;
    final formzRef = ref.contractForm;
    final formzRefNot = ref.formzWatch;
    final formzRefread = ref.formzRead;

    return AlertDialog(
      title: Row(
        children: [
          TextWidget('목표금액 수정', 15,appWidth),
        ],
      ),
      content: Container(
        height: 66,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(5.0.w, 0.0, 0.0, 0.0),
                child: SettingBox(
                  controller: _controller,
                  onChanged: (val) {
                    final cleanedValue = _controller.text.replaceAll(',', '');
                    formzRefread.onChangeGoal(cleanedValue);
                    final value = int.tryParse(cleanedValue);
                    if (value != null) {
                     ref.read(updateContractProvider(value));

                    }

                  },
                ),
              ),
            ),
            SizedBox(height: 7.5),
            Padding(
              padding: EdgeInsets.fromLTRB(5.0.w, 0.0, 0.0, 0.0),
              child: ErrorText(formzRefNot.goalError, appWidth),
            ),
          ],
        ),
      ),

      actions: [
        Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: () {
                customMsg('취소되었습니다.');
                Navigator.pop(context);
              },
              child: TextWidget('취소', 15,appWidth),
            ),
            TextButton(
              onPressed: () => ref.refreshgoal(context),
              child: TextWidget('수정', 15,appWidth),
            ),
          ],
        )
      ],

    );

  }
}

class SettingBox extends ConsumerWidget {

  final void Function(String) onChanged;
  final TextEditingController controller;

  const SettingBox({super.key,required this.onChanged, required this.controller,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      cursorColor: Colors.grey.shade500,
      keyboardType: TextInputType.number,
      inputFormatters: [
        ThousandsFormatter(),
      ],
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        hintText: '100,000,000',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        prefixText: '₩ ',
        prefixStyle: ContractFontStyle(),
      ),
      onChanged: onChanged,


    );
  }
}


