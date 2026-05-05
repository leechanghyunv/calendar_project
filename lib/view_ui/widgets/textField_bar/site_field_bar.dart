import 'package:calendar_project_240727/core/export_package.dart';

import '../../../base_app_size.dart';
import '../../../base_consumer.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/extentions/theme_extension.dart';
import '../../../core/utils/formatter.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../data/provider/string_list_provider.dart';
import '../../screen/contract_setting_screen/component/number_picker_modal.dart';

class SiteFieldBar extends HookConsumerWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> nodes;
  final List<String> hintTexts;
  final ValueNotifier<int> FieldBarIndex;

  const SiteFieldBar({
    super.key,
    required this.controllers,
    required this.nodes,
    required this.hintTexts,
    required this.FieldBarIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final fontSize = context.width.responsiveSize([15, 13.5, 13.5, 13.5, 13, 12,]);
    final iconSize = context.width.responsiveSize([25, 24, 24, 23, 21, 18.5]);

    final currentIndex = useValueListenable(FieldBarIndex);
    final currentController = controllers[currentIndex];
    final currentNode = nodes[currentIndex];
    final isLast = currentIndex == controllers.length - 1;

    // 🔥 Index 변경 시마다 해당 Node로 자동 포커스
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        currentNode.requestFocus();
      });
      return null;
    }, [currentIndex]);


    // 인덱스별 설정 내부 정의
    final configs = [
      (
        controller: controllers[0],
        focusNode: nodes[0],
        hint: '현장명 입력',
        keyboardType: TextInputType.text,
        formatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(20)],
      ),
      (
        controller: controllers[1],
        focusNode: nodes[1],
        hint: '계약 단가 입력',
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        formatters: <TextInputFormatter>[
          CommaInputFormatter6Digits(),
        ],
      ),
      (
        controller: controllers[2],
        focusNode: nodes[2],
        hint: '세율 입력',
        keyboardType: TextInputType.number,
        formatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          TextInputFormatter.withFunction((oldValue, newValue) {
            final value = double.tryParse(newValue.text);
            if (value != null && value > 100) return oldValue;
            return newValue;
          }),
        ],
      ),
    ];

    final current = configs[currentIndex];

    useEffect(() {
      void onTextChanged() {
        HapticFeedback.selectionClick();
        final focusedIndex = nodes.indexWhere((node) => node.hasFocus);
        final text = controllers[focusedIndex].text;
        final cleanText = text.replaceAll(',', '');
        switch (focusedIndex) {
          // case 0: customMsg(cleanText); break;
          // case 1: customMsg(cleanText); break;
          // case 2: customMsg(cleanText); break;
        }
      }
      for (var controller in controllers) {
        controller.addListener(onTextChanged);
      }
      return () {
        for (var controller in controllers) {
          controller.removeListener(onTextChanged);
        }
      };
    }, []);

    void handleNext() {
      currentNode.requestFocus();
      if (isLast) {
        FocusScope.of(context).unfocus();
        FieldBarIndex.value = 0;
      } else {
        // final labels = ['연장근무 자리 입력', '야간근무 자리 입력','세율 입력'];
        // customMsg('${labels[currentIndex]}');
        FieldBarIndex.value++;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: context.isDark ? Colors.black87 : Colors.grey[100],
        border: Border.all(
          color: context.isDark ? Colors.white : Colors.white,
          width: context.isDark ? 0.75 : 0.35,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
          children: [
            Expanded(
                child: TextField(
                  focusNode: current.focusNode,
                  controller: current.controller,
                  keyboardType: current.keyboardType,
                  inputFormatters: current.formatters,

                  cursorColor: Colors.grey.shade700,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Platform.isAndroid ? fontSize + 1.5 : fontSize,
                  ),
                  decoration: InputDecoration(
                    // prefixText: currentController.text.isNotEmpty ? (currentIndex == 3 ? ' ': '₩ ') : null,
                    isDense: true,
                    hintText: hintTexts[currentIndex],
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: Platform.isAndroid ? fontSize + 1.5 : fontSize,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
            ),
            IconButton(
                onPressed: (){
                  if (currentIndex == 0 || currentIndex == 1){
                    handleNext();
                  } else if (currentIndex == 2){
                    Navigator.pop(context);
                    ref.refreshState(context);
                      WidgetsBinding.instance.addPostFrameCallback((_){
                        NumberPickerModal(context);
                      });
                    ref.read(stringListNotifierProvider.notifier).add(
                        value: controllers[0].text,
                        pay: controllers[1].text,
                        tax: controllers[2].text
                    );
                  }
                },
                icon: Icon(
                  isLast ? Icons.check : Icons.arrow_forward,
                  color: context.isDark
                      ? currentController.text.length >= 1 ? Colors.white : Colors.grey.shade700
                      : currentController.text.length >= 1 ? Colors.teal.shade700 : Colors.grey.shade400,
                  size: iconSize,
                ),
            ),
          ]
      ),
    );
  }
}
