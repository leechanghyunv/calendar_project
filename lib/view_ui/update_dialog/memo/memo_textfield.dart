import 'package:calendar_project_240727/core/export.dart';

import 'package:calendar_project_240727/repository/formz_memo.dart';
import '../../../core/widget/text_widget.dart';
import '../../../model/formz_memo_model.dart';
import '../../../repository/calendar_time_controll.dart';
import '../../../view_model/history_model.dart';

class MemoTextfield extends ConsumerStatefulWidget {
  const MemoTextfield({super.key});

  @override
  ConsumerState<MemoTextfield> createState() => _MemoTextfieldState();
}

class _MemoTextfieldState extends ConsumerState<MemoTextfield> {

  List<String> historyMemoList = [];
  final FocusNode _nodeMemo = FocusNode();
  final _memoFormKey = GlobalKey<FormState>();
  final TextEditingController _memoController = TextEditingController();

  @override
  void dispose() {
    _nodeMemo.dispose();  // FocusNode 해제
    _memoController.dispose();  // TextEditingController 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final date = ref.watch(timeManagerProvider).selected;
    final formzState = ref.watch(formzMemoValidatorProvider);
    final formzRefNot = ref.watch(formzMemoValidatorProvider.notifier);
    final formzRefread = ref.read(formzMemoValidatorProvider.notifier);
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;
    ref.listen(formzMemoValidatorProvider, (pre,cur) async {
      if (cur.status == MemoFormzStatus.submissionSuccess){
        print('formzMemoValidatorProvider ${cur.status}');
        /// String 값을 다른 프로바이더에 넘겨줌, 다른 매써드 필요없음
      }
    }
    );

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: appWidth > 500 ? 4.0.w : 8.0.w),
          child: Container(
            width: appHeight < 700
                ? appWidth > 500 ? 127.5.w : 255.w
                : appWidth > 500 ? 130.0.w : 260.w,

            height: appWidth > 500 ? 25.sp : 50.sp,
            color: Colors.grey[300],
            child: KeyboardActions(
              config: _buildConfigMemo(context,appWidth),
              child: Column(
                children: [
                  Form(
                    key: _memoFormKey,
                    child: TextFormField(
                      controller: _memoController,
                      focusNode: _nodeMemo,
                      cursorColor: Colors.grey.shade600,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade400),
                        ),
                        hintText: '${date.month}월 ${date.day}일 메모 내용을 입력해주세요',
                        hintStyle: const TextStyle(
                          fontSize: 13,letterSpacing: 0.5,
                        ),
                      ),
                      onChanged: (val){
                        formzRefread.onChangeMemo(val);
                      },
                      onFieldSubmitted: (val){
                        formzRefread.onSubmit(ref);
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(

            children: [
              TextWidget2(
                  formzRefNot.memoError,
                  appWidth > 500? 4.25.sp : 8.5.sp,
                  formzRefNot.memoError.length > 30
                      ? Colors.purple.shade900
                      : Colors.grey.shade900,appWidth
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  KeyboardActionsConfig _buildConfigMemo(BuildContext context,double appWidth){

    final formzRefread = ref.read(formzMemoValidatorProvider.notifier);

    final history = ref.watch(viewHistoryProvider);
    history.when(
        data: (val) => historyMemoList = val
            .where((e) => e.memo.length > 1)
            .map((e) => e.memo).toSet()
            .toList().reversed.toList(),
        error: (err,trace) {},
        loading: () {});

    return KeyboardActionsConfig(
      keyboardBarColor: Colors.grey[200],
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
            focusNode: _nodeMemo,
          toolbarButtons: [
            (node){
              if (historyMemoList.isEmpty) {
                return TextWidget2(
                    '메모 입력 후 근무유형을 선택해야 합니다. ',
                    13,Colors.grey.shade700,appWidth); //historyMemoList가 비어있다면 빈 위젯 반환
              }
              return ListView(
                scrollDirection: Axis.horizontal,  // 가로 스크롤 가능하도록 설정
                shrinkWrap: true,  // ListView가 남는 공간을 차지하지 않도록 설정
                children: historyMemoList.take(3).map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      backgroundColor: Colors.grey[400],
                      label: Text(
                        item.toString().length > 4 ? '${item.toString().substring(0, 4)}...' : item.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: _memoController.text == item.toString(),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _memoController.text = item.toString();
                            formzRefread.onChangeMemo(_memoController.text);
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
      ]
    );

  }





}
