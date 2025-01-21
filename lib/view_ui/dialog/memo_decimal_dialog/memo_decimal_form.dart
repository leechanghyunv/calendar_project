import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/firebase_analytics.dart';
import 'package:calendar_project_240727/view_model/contract_model.dart';
import '../../../model/formz_decimal_model.dart';
import '../../../repository/formz/formz_decimal.dart';
import '../../minor_issue/default/default_dialog.dart';

import '../dialog_text.dart';
import 'decimal_component.dart';
import 'memo_decimal_textfield.dart';


class EnrollDialogWidget extends ConsumerStatefulWidget {
  const EnrollDialogWidget({super.key});

  @override
  ConsumerState<EnrollDialogWidget> createState() => _EnrollDialogWidghtState();
}

class _EnrollDialogWidghtState extends ConsumerState<EnrollDialogWidget> {

  bool isStateEmpty = true;

  final TextEditingController _memoController = TextEditingController();
  final TextEditingController _decimalController = TextEditingController();

  final FocusNode _nodeMemo = FocusNode();
  final FocusNode _nodeDecimal = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(viewContractProvider.future);
    });
  }

  @override
  void dispose() {
    _memoController.dispose();
    _decimalController.dispose();
    _nodeMemo.dispose();
    _nodeDecimal.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final MemoState = ref.memoState;
    final formzMemoRefNot = ref.formzMemoWatch;
    final formzMemoRefread = ref.formzMemoRead;

    final decimalState = ref.decimalState;
    final formzRefNot = ref.decimalWatch;
    final formzRefread = ref.decimalRead;

    ref.listen(formzDecimalValidatorProvider, (pre,cur) async {
      if (cur.status == DecimalFormzStatus.submissionSuccess) {
        ref.refreshState(context);
      }
    });


    return DefaultDialog(
      title: MemoDecimalTitle(),
      children: [
        Form(
          child: MomoDecimalBox(
            memoTextfield: MemoTextfield(
              memoController: _memoController,
              nodeMemo: _nodeMemo,
              hintText: ' ${ref.month}월 ${ref.day}일 메모 내용을 입력해주세요',
              onChanged: (val){
                formzMemoRefread.onChangeMemo(val);
              },
              onFieldSubmitted: (val){
                formzMemoRefread.onSubmit(ref);
              },
            ),
            memoErrorText: formzMemoRefNot.memoError,
            decimalTextfield: DecimalTextfield(
              decimalController: _decimalController,
              decimalNode: _nodeDecimal,
              hintText: ' 근무유형을 직접 입력 해주세요',
              onChanged: (val){
                setState(() => isStateEmpty = val.isEmpty);
                final decimalValue = val == '' ? 1.0 : double.parse(_decimalController.text);
                formzRefread.onChangeDecimal(decimalValue);
              },
            ),
            decimalErrorText: formzRefNot.decimalError,
          ),
        ),
      ],


      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8.0.w, 0.0, 0.0, 4.0.w),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: ButtonTextWidget('${ref.month}월 모두 등록',
                    13,color: isStateEmpty ? Colors.grey.shade700 : Colors.black,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0.w, 0.0, 0.0, 4.0.w),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: ButtonTextWidget('나가기',14,color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0.w, 0.0, 0.0, 4.0.w),
              child: TextButton(
                onPressed: () =>formzRefread.onSubmit(),
                child: ButtonTextWidget(
                    '확인',14,
                    color: isStateEmpty ? Colors.black : Colors.green.shade600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



