import '../../../core/export_package.dart';
import '../../../core/utils/converter.dart';
import '../../../core/widget/text_widget.dart';
import '../../../repository/formz/formz_decimal.dart';
import '../../../repository/formz/formz_memo.dart';
import '../../../view_model/history_model.dart';

class MemoTextfield extends ConsumerStatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController memoController;
  final FocusNode nodeMemo;

  const MemoTextfield(
      {super.key,
      required this.memoController,
      required this.nodeMemo,
      required this.hintText,
      this.onChanged,
      this.onFieldSubmitted});

  @override
  ConsumerState<MemoTextfield> createState() => _MemoTextfieldState();
}

class _MemoTextfieldState extends ConsumerState<MemoTextfield> {
  List<String> historyMemoList = [];

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.5),
      ),
      child: KeyboardActions(
        config: _buildConfigMemo(context, appWidth),
        child: TextFormField(
          controller: widget.memoController,
          focusNode: widget.nodeMemo,
          cursorColor: Colors.grey.shade500,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 13),
            border: InputBorder.none,
            isDense: true,
          ),
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      ),
    );
  }

  KeyboardActionsConfig _buildConfigMemo(
      BuildContext context, double appWidth) {
    final formzRefread = ref.read(formzMemoValidatorProvider.notifier);

    final history = ref.watch(viewHistoryProvider);
    history.when(
        data: (val) => historyMemoList = val
            .where((e) => e.memo.length > 1)
            .map((e) => e.memo)
            .toSet()
            .toList()
            .reversed
            .toList(),
        error: (err, trace) {},
        loading: () {});

    return KeyboardActionsConfig(
        keyboardBarColor: Colors.grey[200],
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: widget.nodeMemo,
            toolbarButtons: [
              (node) {
                if (historyMemoList.isEmpty) {
                  return TextWidget2('메모 입력 후 키보드에 완료버튼 눌러주세요 ', 13,
                      Colors.grey.shade700, appWidth);
                }
                return ListView(
                  scrollDirection: Axis.horizontal, // 가로 스크롤 가능하도록 설정
                  shrinkWrap: true, // ListView가 남는 공간을 차지하지 않도록 설정
                  children: historyMemoList.take(3).map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        backgroundColor: Colors.grey[400],
                        label: Text(
                          item.toString().length > 4
                              ? '${item.toString().substring(0, 4)}...'
                              : item.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        selected: widget.memoController.text == item.toString(),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              widget.memoController.text = item.toString();
                              formzRefread
                                  .onChangeMemo(widget.memoController.text);
                              node.unfocus(); // 포커스 해제
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
        ]);
  }
}

class DecimalTextfield extends ConsumerStatefulWidget {
  final TextEditingController decimalController;
  final FocusNode decimalNode;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  const DecimalTextfield({
    super.key,
    required this.decimalController,
    required this.decimalNode,
    required this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  ConsumerState<DecimalTextfield> createState() => _DecimalTextfieldState();
}

class _DecimalTextfieldState extends ConsumerState<DecimalTextfield> {

  List<double> historyList = [];

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.5),
      ),
      child: KeyboardActions(
        config: _buildConfigDecimal(context, appWidth),
        child: TextFormField(
        controller: widget.decimalController,
        focusNode: widget.decimalNode,
        cursorColor: Colors.grey.shade500,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,3}')),
          TwoDigitInputFormatter(),
        ],
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 13),
          border: InputBorder.none,
          isDense: true,
        ),
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    ),
    );
  }


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
          focusNode: widget.decimalNode,
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
                        style: const TextStyle(
                            color: Colors.black,fontWeight: FontWeight.bold),
                      ),  // historyList의 값 표시
                      selected: widget.decimalController.text == item.toString(),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            widget.decimalController.text = item.toString();  // 선택한 값 설정
                            final decimalValue = double.tryParse(widget.decimalController.text) ?? 0.0;
                            formzRefread.onChangeDecimal(decimalValue);
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
