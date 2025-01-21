import 'package:calendar_project_240727/base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../dialog_text.dart';
import '../input_dialog/goal_input_textfield.dart';
import '../input_dialog/tax_textfield.dart';

class GoalAmountSection extends ConsumerStatefulWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final FocusNode nodeText1;
  final FocusNode nodeText2;

  const GoalAmountSection(
      this.controller1, this.controller2,
      this.nodeText1, this.nodeText2,
      {super.key});

  @override
  ConsumerState<GoalAmountSection> createState() => _GoalAmountSectionState();
}

class _GoalAmountSectionState extends ConsumerState<GoalAmountSection> {
  // static 변수로 상태 유지
  static bool _hasBeenFocused = false;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    widget.nodeText1.addListener(_handleFocusChange);
    widget.nodeText2.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.nodeText1.removeListener(_handleFocusChange);
    widget.nodeText2.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    if (widget.nodeText1.hasFocus || widget.nodeText2.hasFocus) {
      _hasBeenFocused = true;  // 한 번 포커스되면 계속 true로 유지
    }
    setState(() {
      isKeyboardVisible = widget.nodeText1.hasFocus || widget.nodeText2.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formzRefNot = ref.formzWatch;
    final formzRefread = ref.formzRead;
    final appWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
          child: (_hasBeenFocused || isKeyboardVisible)  // 한 번 포커스되었거나 현재 키보드가 보이면 숨김
              ? const SizedBox.shrink()
              : Row(
            key: const ValueKey<bool>(false),
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DialogTextWidget('목표금액을 입력해주세요', 15),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: GoalInputTextfield(
                  controller: widget.controller1,
                  focusNode: widget.nodeText1,
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
                  controller2: widget.controller2,
                  focusNode: widget.nodeText2,
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
