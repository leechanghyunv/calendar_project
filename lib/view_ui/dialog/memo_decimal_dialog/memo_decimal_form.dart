import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/repository/view_controll/decimal_bool_repo.dart';
import '../../../model/formz_decimal_model.dart';
import '../../../repository/formz/formz_decimal.dart';
import '../../minor_issue/default/default_dialog.dart';

import '../dialog_text.dart';
import 'decimal_component.dart';
import 'memo_decimal_textfield.dart';


class EnrollDialogWidget extends HookConsumerWidget {
  const EnrollDialogWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;


    final memoController = useTextEditingController();
    final decimalController = useTextEditingController();
    final memoFocus = useFocusNode();
    final decimalFocus = useFocusNode();

    final formzMemoRefNot = ref.formzMemoWatch;
    final formzMemoRefread = ref.formzMemoRead;
    ref.watch(formzDecimalValidatorProvider);
    final formzRefNot = ref.decimalWatch;
    final formzRefread = ref.decimalRead;

    final decimalBool = ref.watch(decimalBoolRepoProvider);
    final data = ref.history;

    useEffect(() {
      final sub = ref.listenManual(
        formzDecimalValidatorProvider,
            (prev, next) {
          if (next.status == DecimalFormzStatus.submissionSuccess) {
            ref.refreshState(context);
            Navigator.pop(context);

          }
        },
      );
      return sub.close;
    }, []);

    return data.maybeWhen(
      data: (val) {
        return DefaultDialog(
          children: [
            Form(
              child: MomoDecimalBox(
                decimalTextField: DecimalTextField(
                  decimalController: decimalController,
                  decimalNode: decimalFocus,
                  hintText: ' 공수를 직접 입력 해주세요',
                  onChanged: (val) {
                    ref.read(decimalBoolRepoProvider.notifier).changeDecimalBool(val.isEmpty);
                    final decimalValue = val.isEmpty ? 1.0 : double.tryParse(val) ?? 1.0;
                    formzRefread.onChangeDecimal(decimalValue);
                  },
                  onRecordChanged: (String? val){
                    if(val != null){
                      ref.read(decimalBoolRepoProvider.notifier).changeDecimalBool(val.isEmpty);
                      final decimalValue = val.isEmpty ? 1.0 : double.tryParse(val) ?? 1.0;
                      formzRefread.onChangeDecimal(decimalValue);
                      decimalController.text = decimalValue.toString();
                    }
                  }
                ),


                decimalErrorText: formzRefNot.decimalError,
                memoTextField: MemoTextField(
                  memoController: memoController,
                  nodeMemo: memoFocus,
                  onChanged: formzMemoRefread.onChangeMemo,
                  onFieldSubmitted: (_) => formzMemoRefread.onSubmit(ref),
                ),
                memoErrorText: formzMemoRefNot.memoError,

              ),
            ),
          ],
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0.w, 0, 0, 4.0.w),
                  child: TextButton(
                    onPressed: () => formzRefread.onSubmitMonthAll(),
                    child: ButtonTextWidget(
                      '${ref.month}월 모두 등록',
                      13,
                      color: decimalBool ? Colors.white : Colors.grey.shade800,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0.w),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: ButtonTextWidget('나가기',
                        appWidth > 450 ? 15.5 : 14, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0.w),
                  child: TextButton(
                    onPressed: () => formzRefread.onSubmit(
                      decimal: double.tryParse(decimalController.text),
                    ),
                    child: ButtonTextWidget(
                      '등록', appWidth > 450 ? 15.5 : 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
