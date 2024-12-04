import 'package:calendar_project_240727/view_ui/dialog/input_dialog/contract_textfield.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../repository/formz/formz_model.dart';
import '../dialog_text.dart';
import '../input_dialog/goal_input_textfield.dart';
import '../input_dialog/tax_textfield.dart';

class GoalAmountSection extends ConsumerWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final FocusNode nodeText1;
  final FocusNode nodeText2;

  const GoalAmountSection(
      this.controller1, this.controller2,
      this.nodeText1, this.nodeText2,
      {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formzRefNot = ref.watch(formzValidatorProvider.notifier);
    final formzRefread = ref.read(formzValidatorProvider.notifier);

    final appWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DialogTextWidget('1. 목표금액을 입력해주세요', 15),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: GoalInputTextfield(
                  controller: controller1,
                  focusNode: nodeText1,
                  textInputAction: TextInputAction.next,
                  edgeValue: 5.0,
                  hintMsg: '100,000,000',
                  autofocus: false,
                  onChanged: (val) {
                    final cleanedValue = val.replaceAll(',', '');
                    formzRefread.onChangeGoal(cleanedValue);
                  }),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: TaxinputTextfield(
                  controller2: controller2,
                  focusNode: nodeText2,
                  textInputAction: TextInputAction.next,
                  onChanged: (val) => formzRefread.onChangeTax(val)),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: ErrorText(formzRefNot.goalError, appWidth),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                    child: ErrorText2(formzRefNot.taxError, appWidth))),
          ],
        ),
      ],
    );
  }
}
