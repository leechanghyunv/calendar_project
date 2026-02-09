import 'package:dartx/dartx.dart';

import '../../../../base_app_size.dart';
import '../../../../base_consumer.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/extentions/theme_extension.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../core/widget/toast_msg.dart';
import '../../../../model/formz/formz_model.dart';
import '../../../../repository/formz/formz_model.dart';
import '../../../../view_model/view_provider/main_button_index_provider.dart';

class DailyWageFieldBar extends HookConsumerWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> nodes;
  final List<String> hintTexts;
  final ValueNotifier<int> FieldBarIndex;

  const DailyWageFieldBar({
    super.key,
    required this.controllers,
    required this.nodes,
    required this.hintTexts,
    required this.FieldBarIndex,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    ref.contractForm;
    final formzRefNot = ref.formzWatch;
    final formzRefRead = ref.formzRead;

    final currentIndex = useValueListenable(FieldBarIndex);

    final fontSize = context.width.responsiveSize([15,13.5,13.5,13.5,13,12]);
    final iconSize = context.width.responsiveSize([25,24,24,23,21,18.5]);

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


    useEffect(() {
      void onTextChanged() {
        final focusedIndex = nodes.indexWhere((node) => node.hasFocus);
        final text = controllers[focusedIndex].text;
        final cleanText = text.replaceAll(',', '');
        switch (focusedIndex) {
          case 0: formzRefRead.onChangePay1(cleanText); break;
          case 1: formzRefRead.onChangePay2(cleanText); break;
          case 2: formzRefRead.onChangePay3(cleanText); break;
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
        final labels = ['연장근무 자리 입력', '야간근무 자리 입력','세율 입력'];
        customMsg('${labels[currentIndex]}');
        FieldBarIndex.value++;
      }
    }

    void jumpToThird() {
      final base = controllers[0].text.replaceAll(',', '').toIntOrNull();
      controllers[0].text = base.toString();
      if (base != null && base > 0) {
        controllers[1].text = (base * 1.5).toInt().toString();
        controllers[2].text = (base * 2).toInt().toString();
        FieldBarIndex.value = 3;
        nodes[3].requestFocus();
        customMsg(hintTexts[3]);
      } else {
        customMsg('기본 일당을 먼저 입력해주세요');
        FieldBarIndex.value = 0;
        nodes[0].requestFocus();
      }
    }

    ref.listen(formzValidatorProvider, (pre, cur) {
      if (cur.status == FormzStatus.submissionSuccess) {
        HapticFeedback.selectionClick();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context, rootNavigator: true).pop();
          if (context.mounted) {
            ref.read(selectedIndexProvider.notifier).setIndex(1);
            context.go('/calendar');
          }
        });

      }
    });

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
                focusNode: currentNode,
                controller: currentController,
                maxLines: null,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  if (currentIndex == 0 || currentIndex == 1 || currentIndex == 2)
                    ...[
                      CommaInputFormatter6Digits(),
                    ]
                  else if (currentIndex == 3)
                    ...[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        final value = double.tryParse(newValue.text);
                        if (value != null && value > 100) return oldValue;
                        return newValue;
                      }),
                    ]

                ],
                cursorColor: Colors.grey.shade700,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
                decoration: InputDecoration(
                  prefixText: currentController.text.isNotEmpty ? (currentIndex == 3 ? ' ': '₩ ') : null,
                  isDense: true,
                  hintText: hintTexts[currentIndex],
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
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
              if (currentIndex == 1 || currentIndex == 2) {
                handleNext();
              } else if (currentIndex == 3) {
                final pay1 = controllers[0].text.replaceAll(',', '');
                final pay2 = controllers[1].text.replaceAll(',', '');
                final pay3 = controllers[2].text.replaceAll(',', '');
                final taxText = controllers[3].text;
                final tax = taxText.isEmpty ? 3.3 : (taxText.toDoubleOrNull() ?? 3.3);

                print('기본 일당: ${controllers[0].text}');
                print('연장근무: ${controllers[1].text}');
                print('야간근무: ${controllers[2].text}');
                print('세율: ${controllers[3].text}');
                print('세율: ${tax}');

                formzRefRead
                  ..onChangePay1(pay1)
                  ..onChangePay2(pay2)
                  ..onChangePay3(pay3)
                  ..onChangeTax(tax)
                  ..onSubmit(context, FocusNode(), '', '');

              } else {
                jumpToThird();
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
        ],
      ),
    );
  }
}
