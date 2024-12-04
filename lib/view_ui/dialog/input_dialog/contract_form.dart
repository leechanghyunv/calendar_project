import 'package:calendar_project_240727/core/export_package.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../model/formz_model.dart';
import '../../../repository/formz/formz_model.dart';
import '../../../repository/time/calendar_time_controll.dart';
import '../../minor_issue/widget/qr_container.dart';
import '../dialog_text.dart';
import '../keydoard_section.dart';
import '../section_contract_form/goal_amount_section.dart';
import '../section_contract_form/work_condition_section.dart';
import 'back_up_data/back_up_dialog.dart';
import 'contract_form_box.dart';

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
  final FocusNode _nodeText6 = FocusNode();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  @override
  void dispose() {
    _nodeText1.dispose();
    _nodeText2.dispose();
    _nodeText3.dispose();
    _nodeText4.dispose();
    _nodeText5.dispose();
    _nodeText6.dispose();

    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
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
      if(cur.status == FormzStatus.submissionSuccess){
        Navigator.pushReplacementNamed(context, '/main');
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

      content: ContractFormBox(
        child: KeyboardActions(
          config: _buildConfig(context,ref,selected,appWidth),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GoalAmountSection(
                  _controller1,
                  _controller2,
                  _nodeText1,
                  _nodeText2,
                ),
                SizedBox(height: appHeight < 700 ? 7.sp : 10.sp),
                WorkConditionSection(
                  _controller3,
                  _controller4,
                  _controller5,
                  _controller6,
                  _nodeText3,
                  _nodeText4,
                  _nodeText5,
                  _nodeText6,
                ),
              ],
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
                child:  ButtonTextWidget('데이터 백업관리',13,color: Colors.grey),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: ButtonTextWidget('취소',16,),
            ),
            TextButton(
              onPressed: ()  => formzRefread.onSubmit(
                  context,selected,_nodeText1,_nodeText2,
              ),
              child: ButtonTextWidget('저장',16),
            ),
          ],
        ),


      ],
    );
  }


  KeyboardActionsConfig _buildConfig(
      BuildContext context,WidgetRef ref,DateTime selected,double appWidth,
      ) {

    return KeyboardActionsConfig(
      keyboardBarColor: Colors.grey[200],
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        createKeyboardItem(
          focusNode: _nodeText1,
          text: "👉 세율입력란으로 넘어가기",
          onTap: () => FocusScope.of(context).requestFocus(_nodeText2),
          appWidth: appWidth,
        ),
        createKeyboardItem(
          focusNode: _nodeText2,
          text: "👉 정상근무입력란으로",
          onTap: () => FocusScope.of(context).requestFocus(_nodeText3),
          appWidth: appWidth,
        ),

        raactiveKeyboardItem(
          focusNode: _nodeText3,
          controller: _controller3,
          text: "👉 연장근무입력란으로",
          onTap: () => FocusScope.of(context).requestFocus(_nodeText4),
          appWidth: appWidth,
        ),

        createKeyboardItem(
          focusNode: _nodeText4,
          text: "👉 야간근무입력란으로",
          onTap: () => FocusScope.of(context).requestFocus(_nodeText5),
          appWidth: appWidth,
        ),

        createKeyboardItem(
          focusNode: _nodeText5,
          text: "👉 일비 입력란으로",
          onTap: () => FocusScope.of(context).requestFocus(_nodeText6),
          appWidth: appWidth,
        ),
        createKeyboardItem(
          focusNode: _nodeText6,
          text: "👉 모두 입력했습니다",
          onTap: () {
            customMsg('저장을 눌러주세요');
            _nodeText6.unfocus();
            ref.read(formzValidatorProvider.notifier).onSubmit(
                context, selected, _nodeText1, _nodeText2);
          },
          appWidth: appWidth,
        ),
      ],
    );
  }
}



