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
  final Future<void> Function()? onComplete;

  const SiteFieldBar({
    super.key,
    required this.controllers,
    required this.nodes,
    required this.hintTexts,
    required this.FieldBarIndex,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentIndex = useValueListenable(FieldBarIndex);

    final fontSize = context.width.responsiveSize([15, 13.5, 13.5, 13.5, 13, 12,]);
    final iconSize = context.width.responsiveSize([25, 24, 24, 23, 21, 18.5]);

    final currentController = controllers[currentIndex];
    useListenable(currentController);

    final isLast = currentIndex == controllers.length - 1;

    // 인덱스별 설정 내부 정의
    final configs = [
      (
        controller: controllers[0],
        focusNode: nodes[0],
        hint: hintTexts[0],
        keyboardType: TextInputType.multiline,
        formatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(20)],
      ),
      (
        controller: controllers[1],
        focusNode: nodes[1],
        hint: hintTexts[1],
        keyboardType: TextInputType.number,
        formatters: <TextInputFormatter>[
          CommaInputFormatter6Digits(),
        ],
      ),
      (
        controller: controllers[2],
        focusNode: nodes[2],
        hint: hintTexts[2],
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        formatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          TextInputFormatter.withFunction((oldValue, newValue) {
            final value = double.tryParse(newValue.text);
            if (value != null && value > 100) return oldValue;
            return newValue;
          }),
        ],
      ),
      (
      controller: controllers[3],
      focusNode: nodes[3],
      hint: hintTexts[3],
      keyboardType: TextInputType.number,
      formatters: <TextInputFormatter>[
        CommaInputFormatter6Digits(),
      ],
      ),
    ];

    final current = configs[currentIndex];

    // 🔥 Index 변경 시마다 해당 Node로 자동 포커스
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        current.focusNode.requestFocus();
      });
      return null;
    }, [currentIndex]);


    void handleNext() async {
      HapticFeedback.selectionClick();
      if (currentIndex == 0 && controllers[0].text.trim().isEmpty) {
        customMsg('현장명을 입력해주세요');
        return;
      }

      if (currentIndex == 1) {
        final raw = controllers[1].text.replaceAll(',', '');
        if (raw.length <= 5 || int.tryParse(raw) == null) {
          customMsg('일당은 만원대 이하일 수 없습니다');
          return;
        }
      }

      if (isLast) {
        if (onComplete != null) {
          await onComplete!();
        } else {
          FocusScope.of(context).unfocus();
          FieldBarIndex.value = 0;

          await ref.read(stringListNotifierProvider.notifier).add(
            value: controllers[0].text,
            pay: controllers[1].text,
            tax: controllers[2].text,
            subsidy: controllers[3].text,
          );
          customMsg('${controllers[0].text} 조건 적용');
          await ref.refreshState(context);
          Navigator.pop(context);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            NumberPickerModal(context);
          });
        }
      } else {
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
                  key: ValueKey(currentIndex),
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
                onPressed: () => handleNext(),
                icon: Icon(
                  isLast ? Icons.check : Icons.arrow_forward,
                  color: context.isDark
                      ? isLast || currentController.text.length >= 1
                      ? Colors.white
                      : Colors.grey.shade700

                      : isLast || currentController.text.length >= 1
                      ? Colors.teal.shade700
                      : Colors.grey.shade400,
                  size: iconSize,
                ),
            ),
          ]
      ),
    );
  }
}
