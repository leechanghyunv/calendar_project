
import 'package:calendar_project_240727/core/export.dart';

import 'package:calendar_project_240727/view_ui/input_dialog/subsidy/daily_subsidy_dialog.dart';
import 'package:calendar_project_240727/view_ui/input_dialog/tax_textfield.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/widget/text_widget.dart';
import '../../core/widget/toast_msg.dart';
import '../../model/formz_model.dart';
import '../../repository/calendar_time_controll.dart';
import '../../repository/formz_model.dart';
import '../minor_issue/widget/qr_container.dart';
import 'back_up_data/back_up_dialog.dart';
import 'contract_textfield.dart';

class InitialSetForm extends ConsumerStatefulWidget {
  const InitialSetForm({super.key});

  @override
  ConsumerState<InitialSetForm> createState() => _InitialSetFormState();
}

class _InitialSetFormState extends ConsumerState<InitialSetForm> {

  final _formKey = GlobalKey<FormState>();

  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();
  final FocusNode _nodeText5 = FocusNode();

  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();

  @override
  void dispose() {
    _nodeText1.dispose();
    _nodeText2.dispose();
    _nodeText3.dispose();
    _nodeText4.dispose();
    _nodeText5.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final formzRef = ref.watch(formzValidatorProvider);
    final formzRefNot = ref.watch(formzValidatorProvider.notifier);
    final formzRefread = ref.read(formzValidatorProvider.notifier);
    final timeManager = ref.watch(timeManagerProvider);
    final selected = timeManager.selected;
    ref.listen(formzValidatorProvider, (pre,cur){
      if(cur.status == FormzStatus.validated){
        showDialog(
          context: context, builder: (context) => const DailySubsidyDialog(),
        );
      }
    });

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        10.0,
      ),

      title: const QrContainer(
        msg: '조건을 입력해주세요',
        textColor: Colors.black,
      ),

      content: SingleChildScrollView(
        child: Container(
          height: appWidth > 500? 375.sp/2 : 375.sp,
          width: appWidth > 500? 55.w : double.infinity,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: KeyboardActions(
              config: _buildConfig(context,ref,selected,appWidth,formzRefNot.extended, formzRefNot.night),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget('1. 목표금액을 입력해주세요', 15, appWidth),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: MoneyinputTextfield(
                              focusNode: _nodeText1,
                              textInputAction: TextInputAction.next,
                              edgeValue: 5.0,
                              hintMsg: '100,000,000',
                              autofocus: false,
                              onChanged: (val){
                                final cleanedValue = val.replaceAll(',', '');
                                formzRefread.onChangeGoal(cleanedValue);
                              }
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: TaxinputTextfield(
                              focusNode: _nodeText2,
                              textInputAction: TextInputAction.next,
                              onChanged: (val) => formzRefread.onChangeTax(val)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                                child: ErrorText(formzRefNot.goalError,appWidth),
                            ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(child: ErrorText2(formzRefNot.taxError,appWidth))),
                      ],
                    ),
                    SizedBox(height: appHeight < 700 ? 7.sp : 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextWidget('2. 근로조건을 입력해주세요', 15, appWidth
                          ),
                        ),
                      ],
                    ),
                    MoneyinputTextfield(
                      controller: _controller3,
                      focusNode: _nodeText3,
                      textInputAction: TextInputAction.next,
                      edgeValue: 4,
                      hintMsg: '150,000',
                      labelMsg: '🌟 1공수(정상근무) *',
                      onChanged: (val){
                        final cleanedValue = val.replaceAll(',', '');
                        formzRefread.onChangePay1(cleanedValue);
                      },
                    ),
                    Row(
                      children: [
                        ErrorText(formzRefNot.pay1Error,appWidth),
                        const Spacer(),

                      ],
                    ),
                    SizedBox(height: 7.sp),
                    MoneyinputTextfield(
                      controller: _controller4,
                      focusNode: _nodeText4,
                      textInputAction: TextInputAction.next,
                      edgeValue: 4,
                      hintMsg: '225,000',
                      labelMsg: '🚀 1.5공수(연장근무) *',
                      onChanged: (val){
                        final cleanedValue = val.replaceAll(',', '');
                        formzRefread.onChangePay2(cleanedValue);
                      },
                    ),
                    Row(
                      children: [
                        ErrorText(formzRefNot.pay2Error,appWidth),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: 7.sp),
                    MoneyinputTextfield(
                      controller: _controller5,
                      focusNode: _nodeText5,
                      textInputAction: TextInputAction.done,
                      edgeValue: 4,
                      hintMsg: '300,000',
                      labelMsg: '🎉 2공수(야간근무) *',
                      onChanged: (val){
                        final cleanedValue = val.replaceAll(',', '');
                        formzRefread.onChangePay3(cleanedValue);
                      },
                    ),
                    ErrorText(formzRefNot.pay3Error,appWidth),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 4.0),
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => const BackUpDialog());
                },
                child: const Text('데이터 백업관리',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ),
            const Spacer(),
            TextButton(onPressed: (){
              Navigator.pop(context);
              // cancelMsg();
            },
              child: TextWidget('취소',16,appWidth),
            ),
            TextButton(
              onPressed: ()  {
                formzRefread.onSubmit(selected);
              },
              child: TextWidget('저장',16,appWidth),
            ),
          ],
        ),


      ],
    );
  }

  KeyboardActionsConfig _buildConfig(
      BuildContext context,WidgetRef ref,DateTime selected,double appWidth,double extended, double night
      ) {

    return KeyboardActionsConfig(
      keyboardBarColor: Colors.grey[200],
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
          toolbarButtons: [
                (node) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(_nodeText2),
                  child: Padding(
                    padding: const EdgeInsets.all( 12.0),
                    child: Row(
                      children: [
                        TextWidget2("👉 세율입력란으로 넘어가기",
                            14,Colors.grey.shade700,appWidth)
                            .animate(onPlay: (controller) => controller.repeat(reverse: true))
                            .fadeOut(duration: 0.5.seconds, curve: Curves.easeInOut),
                      ],
                    ),
                  ),
                ),
              ],
            );
            },
          ],
        ),
        KeyboardActionsItem(
          focusNode: _nodeText2,
          toolbarButtons: [
                (node) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_nodeText3),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextWidget2("👉 정상근무입력란으로",
                      14,Colors.grey.shade700,appWidth)
                      .animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .fadeOut(duration: 0.5.seconds, curve: Curves.easeInOut),
                ),
              );
            },
          ],
        ),
        KeyboardActionsItem(
          focusNode: _nodeText3,
          toolbarButtons: [
                (node) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () => FocusScope.of(context).requestFocus(_nodeText4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextWidget2("👉 연장근무입력란으로",
                          14,Colors.grey.shade700,appWidth)
                          .animate(onPlay: (controller) => controller.repeat(reverse: true))
                          .fadeOut(duration: 0.5.seconds, curve: Curves.easeInOut),
                    ),
                  ),
                ],
              );
            },
          ],
        ),
        KeyboardActionsItem(
          focusNode: _nodeText4,
          toolbarButtons: [
                (node) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () => FocusScope.of(context).requestFocus(_nodeText5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextWidget2("👉 야간근무입력란으로",
                          14,Colors.grey.shade700,appWidth)
                          .animate(onPlay: (controller) => controller.repeat(reverse: true))
                          .fadeOut(duration: 0.5.seconds, curve: Curves.easeInOut),
                    ),
                  ),
                ],
              );
            },
          ],
        ),
        KeyboardActionsItem(
          focusNode: _nodeText5,
          toolbarButtons: [
                (node) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      customMsg('저장을 눌러주세요');
                      node.unfocus();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          TextWidget2("👉 모두 입력했습니다",
                              14,Colors.grey.shade700,appWidth)
                              .animate(onPlay: (controller) => controller.repeat(reverse: true))
                              .fadeOut(duration: 0.5.seconds, curve: Curves.easeInOut),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ],
        ),
      ],
    );
  }
}



