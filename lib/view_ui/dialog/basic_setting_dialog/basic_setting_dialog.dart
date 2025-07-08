import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/view_provider/display_view_record_model.dart';
import '../../screen/auth_screen/component/auth_text.dart';
import '../../screen/statistic_screen/component/function_chip.dart';
import 'displayNumber_textfield.dart';

class BasicSettingDialog extends HookConsumerWidget {
  const BasicSettingDialog({super.key});


  Widget build(BuildContext context,WidgetRef ref) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final firstController = useTextEditingController();
    final secondController = useTextEditingController();
    final thirdController = useTextEditingController();

    final firstFocusNode = useFocusNode();
    final secondFocusNode = useFocusNode();
    final thirdFocusNode = useFocusNode();

    // 🎯 State hooks
    final showFirstNext = useState(false);
    final showSecondNext = useState(false);
    final showThirdNext = useState(false);
    final showSecondField = useState(false);
    final showThirdField = useState(false);



    useEffect(() {
      void onFirstChanged() {
        showFirstNext.value = firstController.text.length >= 2;
      }
      void onSecondChanged() {
        showSecondNext.value = secondController.text.length >= 2;
      }
      void onThirdChanged() {
        showThirdNext.value = thirdController.text.length >= 2;
      }

      firstController.addListener(onFirstChanged);
      secondController.addListener(onSecondChanged);
      thirdController.addListener(onThirdChanged);

      return () {
        firstController.removeListener(onFirstChanged);
        secondController.removeListener(onSecondChanged);
        thirdController.removeListener(onThirdChanged);
      };
    }, []);

    // 🎬 Actions
    void onFirstNext() {
      showSecondField.value = true;
      secondFocusNode.requestFocus();
    }

    void onSecondNext() {
      showThirdField.value = true;
      thirdFocusNode.requestFocus();
    }

    return AlertDialog(
      title: Column(
        children: [
          Row(
            children: [
              bigText('기본공수 변경', height),
              const Spacer(),
            ],
          ),
          SizedBox(height: 2.5),
          Row(
            children: [
              smallText ('등록하고자 하는 공수를 차례로 입력', height),
              const Spacer(),
            ],
          ),
        ],
      ),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade50,
                border: Border.all(
                  color: Colors.grey.shade800,
                  width: 0.85,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: DisplayNumberTextField(
                            controller: firstController,
                            focusNode: firstFocusNode,
                            hintText: ' 1.0 자리에 우선 입력',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: showFirstNext.value ? FunctionChip(
                            label: '이동하기',
                            color: Colors.grey.shade100,
                            borderColor: Colors.grey.shade100,
                            textColor: Colors.grey.shade700,
                            onTap: (){
                              onFirstNext();
                            },
                          ) : SizedBox.shrink(),
                        ),

                      ],
                    ),
                    Spacer(),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DisplayNumberTextField(
                              controller: secondController,
                              focusNode: secondFocusNode,
                              hintText: showSecondField.value ? ' 1.5 자리에 우선 입력' : ' ',
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: showSecondNext.value
                                ? FunctionChip(
                              label: '이동하기',
                              color: Colors.grey.shade100,
                              borderColor: Colors.grey.shade100,
                              textColor: Colors.grey.shade700,
                              onTap: (){
                                onSecondNext();
                              },
                            ) : SizedBox(
                              height: 25,
                            ),
                          ),
                        ],
                      ),

                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: DisplayNumberTextField(
                            controller: thirdController,
                            focusNode: thirdFocusNode,
                            hintText: showThirdField.value ? ' 2.0 자리에 우선 입력' : ' ',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: showThirdNext.value
                              ? FunctionChip(
                            label: '완료하기',
                            color: Colors.grey.shade100,
                            borderColor: Colors.grey.shade100,
                            textColor: Colors.grey.shade700,
                            onTap: (){
                              customMsg('수정 버튼을 눌러주세요');
                            },
                          )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
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
                firstController.clear();
                secondController.clear();
                thirdController.clear();
                showFirstNext.value = false;
                showSecondNext.value = false;
                showThirdNext.value = false;
                showSecondField.value = false;
                showThirdField.value = false;
                // 포커스 초기화
                firstFocusNode.unfocus();
                secondFocusNode.unfocus();
                thirdFocusNode.unfocus();
                firstFocusNode.requestFocus();
                customMsg('취소되었습니다.');
                // Navigator.pop(context);
              },
              child: TextWidget('취소', 15,width),
            ),
            TextButton(
              onPressed: () {
                final normal = double.tryParse(firstController.text) ?? 1.0;
                final extended = double.tryParse(secondController.text) ?? 1.5;
                final night = double.tryParse(thirdController.text) ?? 2.0;
                ref.read(displayValueProvider.notifier).copyWithState(normal, extended, night);
                ref.invalidate(displayValueProvider);
                customMsg('리스트에 반영되었습니다');
                Navigator.pop(context);
              },
              child: TextWidget('수정', 15,width),
            ),
          ],
        )
      ],

    );
  }
}
