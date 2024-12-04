import 'package:calendar_project_240727/view_ui/chart/chart_animation_index.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../repository/formz/formz_model.dart';
import '../auto_animate_text.dart';
import '../auto_copy_icon.dart';
import '../dialog_text.dart';
import '../input_dialog/contract_textfield.dart';
import '../input_dialog/subsidy_textfield.dart';

class WorkConditionSection extends ConsumerWidget {
  final TextEditingController controller3;
  final TextEditingController controller4;
  final TextEditingController controller5;
  final TextEditingController controller6;

  final FocusNode nodeText3;
  final FocusNode nodeText4;
  final FocusNode nodeText5;
  final FocusNode nodeText6;

  const WorkConditionSection(
      this.controller3, this.controller4, this.controller5,this.controller6,
      this.nodeText3, this.nodeText4, this.nodeText5, this.nodeText6,
      {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formzRefNot = ref.watch(formzValidatorProvider.notifier);
    final formzRefread = ref.read(formzValidatorProvider.notifier);

    final appWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: DialogTextWidget('2. 근로조건을 입력해주세요', 15),
            ),
          ],
        ),
        SizedBox(height: 7.sp),
        MoneyinputTextfield(
          controller: controller3,
          focusNode: nodeText3,
          textInputAction: TextInputAction.next,
          hintMsg: '150,000',
          labelMsg: '🌟 1공수(정상근무) *',
          onChanged: (val){
            final cleanedValue = val.replaceAll(',', '');
            formzRefread.onChangePay1(cleanedValue);
            ref.read(autoCopyProvider.notifier).normalValue(val);
          },
          suffixIcon: AutoCopyIcon(nodeText3,nodeText6,controller4,controller5),
        ),
        ErrorReactiveText(errorText: formzRefNot.pay1Error),
        SizedBox(height: 7.sp),
        MoneyinputTextfield(
          controller: controller4,
          focusNode: nodeText4,
          textInputAction: TextInputAction.next,
          hintMsg: '225,000',
          labelMsg: '🚀 1.5공수(연장근무) *',
          onChanged: (val){
            final cleanedValue = val.replaceAll(',', '');
            formzRefread.onChangePay2(cleanedValue);
          },
        ),
        ErrorText(formzRefNot.pay2Error,appWidth),
        SizedBox(height: 7.sp),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: MoneyinputTextfield(
                controller: controller5,
                focusNode: nodeText5,
                textInputAction: TextInputAction.done,
                hintMsg: '300,000',
                labelMsg: '🎉 2공수(야간근무) *',
                onChanged: (val){
                  final cleanedValue = val.replaceAll(',', '');
                  formzRefread.onChangePay3(cleanedValue);
                },
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
                flex: 1,
                child: SubsidyTextfield(
                  controller6,
                  nodeText6,
                  TextInputAction.done,

                ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: ErrorText(formzRefNot.pay3Error,appWidth),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: ErrorText(formzRefNot.subsidyError,appWidth),
            ),
          ],
        ),

      ],
    );
  }



}
