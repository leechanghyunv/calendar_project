import 'package:calendar_project_240727/base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../auto_animate_text.dart';
import '../auto_copy_icon.dart';
import '../dialog_text.dart';
import '../input_dialog/contract_textfield.dart';
import '../input_dialog/pay_textfield.dart';
import '../input_dialog/subsidy_textfield.dart';

class WorkConditionSection extends ConsumerStatefulWidget {
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
  ConsumerState<WorkConditionSection> createState() => _WorkConditionSectionState();
}

class _WorkConditionSectionState extends ConsumerState<WorkConditionSection> {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    widget.nodeText3.addListener(_handleFocusChange);
    widget.nodeText4.addListener(_handleFocusChange);
    widget.nodeText5.addListener(_handleFocusChange);
    widget.nodeText6.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.nodeText3.removeListener(_handleFocusChange);
    widget.nodeText4.removeListener(_handleFocusChange);
    widget.nodeText5.removeListener(_handleFocusChange);
    widget.nodeText6.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      isKeyboardVisible = widget.nodeText3.hasFocus ||
          widget.nodeText4.hasFocus ||
          widget.nodeText5.hasFocus ||
          widget.nodeText6.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formzRefNot = ref.formzWatch;
    final formzRefread = ref.formzRead;
    final appWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1,
                child: child,
              ),
            );
          },
          child: isKeyboardVisible
              ? const SizedBox.shrink()
              : Row(
            key: const ValueKey<bool>(false),
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: DialogTextWidget('근로조건을 입력해주세요', 15),
              ),
            ],
          ),
        ),
        SizedBox(height: 7.sp),
        PayinputTextfield(
          controller: widget.controller3,
          focusNode: widget.nodeText3,
          textInputAction: TextInputAction.next,
          hintMsg: '150,000',
          labelMsg: '🌟 1공수(정상근무) *',
          onChanged: (val){
            final cleanedValue = val.replaceAll(',', '');
            formzRefread.onChangePay1(cleanedValue);
            ref.read(autoCopyProvider.notifier).normalValue(val);
          },
          suffixIcon: AutoCopyIcon(widget.nodeText3,widget.nodeText6,widget.controller4,widget.controller5),
        ),
        ErrorReactiveText(errorText: formzRefNot.pay1Error),
        SizedBox(height: 7.sp),
        MoneyinputTextfield(
          controller: widget.controller4,
          focusNode: widget.nodeText4,
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
                controller: widget.controller5,
                focusNode: widget.nodeText5,
                textInputAction: TextInputAction.done,
                hintMsg: '300,000',
                labelMsg: '🎉 2공수(야간근무) *',
                onChanged: (val){
                  final cleanedValue = val.replaceAll(',', '');
                  formzRefread.onChangePay3(cleanedValue);
                },
              ),
            ),
             SizedBox(width: 5.w),
            Expanded(
              flex: 1,
              child: SubsidyTextfield(
                widget.controller6,
                widget.nodeText6,
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
            SizedBox(width: 4.w),
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
