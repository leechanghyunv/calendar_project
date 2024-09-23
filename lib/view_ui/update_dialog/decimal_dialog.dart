
import 'package:calendar_project_240727/core/export.dart';

import '../../core/widget/decimal_textfield_frame.dart';
import '../../core/widget/text_widget.dart';
import '../../model/formz_decimal_model.dart';
import '../../repository/calendar_time_controll.dart';
import '../../repository/formz_decimal.dart';
import '../../view_model/calendar_event_model.dart';
import '../../view_model/history_model.dart';
import 'decimal_textfield.dart';

class DecimalDialog extends ConsumerStatefulWidget {
  const DecimalDialog({super.key});

  @override
  ConsumerState<DecimalDialog> createState() => _DecimalDialogState();
}

class _DecimalDialogState extends ConsumerState<DecimalDialog> {

  bool isStateEmpty = true;
  List<double> historyList = [];
  final FocusNode _nodeDecimal = FocusNode();
  final _decimalFormKey =  GlobalKey<FormState>();
  final TextEditingController _decimalController = TextEditingController();

  @override
  void dispose() {
    _nodeDecimal.dispose();
    _decimalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formzState = ref.watch(formzDecimalValidatorProvider);
    final formzRefNot = ref.watch(formzDecimalValidatorProvider.notifier);
    final formzRefread = ref.read(formzDecimalValidatorProvider.notifier);
    final date = ref.watch(timeManagerProvider).selected;
    final appWidth = MediaQuery.of(context).size.width;

    double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;

    ref.listen(formzDecimalValidatorProvider, (pre,cur) async {
      if (cur.status == DecimalFormzStatus.submissionSuccess) {
        Future.delayed(const Duration(seconds: 0), () {
          ref.refresh(calendarEventProvider(date));
          ref.read(timeManagerProvider.notifier).selectedNextDay();
          Navigator.pushReplacementNamed(context, '/main');
        });
      }
    });


    Widget textBox() => Padding(
        padding: const EdgeInsets.all(9.5),
        child: Container(
          child: RichText(
              text: TextSpan(
                children: [
                   TextSpan(text: '일',
                      style: TextStyle(
                          color: Colors.black,fontSize: adaptiveSize(20),
                          fontWeight: FontWeight.bold)),
                   TextSpan(text: '당은 소수점에 맞게 계산해서 저장합니다. ',
                      style: TextStyle(color: Colors.black,fontSize: adaptiveSize(13.5),
                          fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                   TextSpan(text: '숫자 0 입력시 휴무처리합니다. ',
                      style: TextStyle(color: Colors.black,fontSize: adaptiveSize(14),
                          fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                   TextSpan(text: '입력 후 ',
                      style: TextStyle(color: Colors.black,fontSize: adaptiveSize(13.5),
                          fontWeight: FontWeight.bold,letterSpacing: 1.0)),

                  TextSpan(text: '확인 ',
                      style: TextStyle(color: isStateEmpty
                          ? Colors.grey.shade700
                          : Colors.purple.shade900,
                          fontSize: adaptiveSize(18),
                          fontWeight: FontWeight.w900)),

                   TextSpan(text: '아이콘을 눌러주세요',
                      style: TextStyle(color: Colors.black,
                          fontSize: adaptiveSize(13.5),
                          fontWeight: FontWeight.bold,letterSpacing: 1.0)),
                ],
              )),
        )
    );

    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            TextWidget(
                '공수를 숫자로 입력해주세요', 15.5 ,appWidth),

            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  12.0),
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black, size: 20),
            ),
          ],
        ),
      ),
      content: Container(
        height: 230,
        width: 50.w,
        child: KeyboardActions(
          config: _buildConfigDecimal(context,appWidth),
          child: Column(
            children: [
              textBox(),
              const SizedBox(height: 10),
              frameBox(
                Row(
                  children: [
                    TextWidget2(
                        formzRefNot.decimalError,
                        12, Colors.purple.shade900,appWidth),
                  ],
                ),
                Form(
                    key: _decimalFormKey,
                    child: DecimalTextfield(
                      controller: _decimalController,
                      focusNode: _nodeDecimal,
                      autofocus: true,
                      onChanged: (val){
                        final decimalValue = double.tryParse(_decimalController.text) ?? 0.0;
                        setState(() => isStateEmpty = val.isEmpty);
                        formzRefread.onChangeDecimal(decimalValue);
                      },
                      iconOnPressed: isStateEmpty
                          ? null
                          : (){
                        formzRefread.onSubmit();
                      },
                      iconColor: isStateEmpty
                          ? Colors.grey.shade700
                          : Colors.purple.shade900,
                    ),
                  ),

              ),
            ],
          ),
        ),
      ),
    );

  }

/// /// ///

  KeyboardActionsConfig _buildConfigDecimal(BuildContext context,double appWidth){

    final formzRefread = ref.read(formzDecimalValidatorProvider.notifier);

    final history = ref.watch(viewHistoryProvider);
    history.when(
        data: (val) => historyList = val
            .where((e) => ![0.0, 1.0, 1.5, 2.0].contains(e.record))
            .map((e) => e.record).toSet()
            .toList().reversed.toList(),
        error: (err,trace) {},
        loading: () {});

    return KeyboardActionsConfig(
      keyboardBarColor: Colors.grey[200],
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeDecimal,
          toolbarButtons: [
            (node){
              if (historyList.isEmpty) {
                return TextWidget2('1.25입력시 일당의 1.25배로 저장합니다. ', 13,
                    Colors.grey.shade700,appWidth);
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: historyList.take(3).map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      backgroundColor: Colors.grey[400],
                      label: Text(item.toString(),
                        style: TextStyle(
                          color: Colors.black,fontWeight: FontWeight.bold),
                      ),  // historyList의 값 표시
                      selected: _decimalController.text == item.toString(),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                          isStateEmpty = selected;
                          _decimalController.text = item.toString();  // 선택한 값 설정
                            final decimalValue = double.tryParse(_decimalController.text) ?? 0.0;
                            formzRefread.onChangeDecimal(decimalValue);
                            isStateEmpty = _decimalController.text.isEmpty;
                            node.unfocus();  // 포커스 해제
                          }
                        });
                      },
                    ),
                  );
                }).toList(),
              );
            }
          ],
        ),
      ],
    );
  }



}

  

