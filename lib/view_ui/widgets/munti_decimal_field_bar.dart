import 'package:dartx/dartx.dart';
import '../../base_app_size.dart';
import '../../core/export_package.dart';
import '../../core/extentions/theme_color.dart';
import '../../core/extentions/theme_extension.dart';
import '../../core/widget/text_widget.dart';
import '../../core/widget/toast_msg.dart';
import '../../view_model/view_provider/display_view_record_model.dart';

class MultiDecimalFieldBar extends HookConsumerWidget {
  final List<TextEditingController> controllers;
  final List<String> hintTexts;
  final ValueNotifier<int> currentIndexNotifier;

  const MultiDecimalFieldBar({
    super.key,
    required this.controllers,
    required this.hintTexts,
    required this.currentIndexNotifier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    final focusNode = useFocusNode();

    final fontSize = context.width.responsiveSize([15,13.5,13.5,13.5,13,12]);
    final iconSize = context.width.responsiveSize([25,24,24,23,21,18.5]);

    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, [currentIndex.value]);

    final currentController = controllers[currentIndex.value];
    final isLast = currentIndex.value == controllers.length - 1;

    void handleNext() {
      focusNode.requestFocus();
      if (isLast) {
        FocusScope.of(context).unfocus();
        ref.read(displayValueProvider.notifier).copyWithState(
          controllers[0].text.toDouble(),
          controllers[1].text.toDouble(),
          controllers[2].text.toDouble(),
        );
        Navigator.pop(context);
        currentIndex.value = 0;

      } else {
        final labels = ['연장근무 자리 입력', '야간근무 자리 입력'];
        customMsg('${labels[currentIndex.value]}');
        currentIndex.value++;
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () async {
                  ref.read(displayValueProvider.notifier).copyWithState(1.0, 1.5, 2.0);
                  currentIndex.value = 0;
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: context.isDark ? Colors.black87 : Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                    child: Row(
                      children: [
                        TextWidget(
                          ' @ 초기화 ', 13,
                          context.width,
                          color: context.subTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
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
                  focusNode: focusNode,
                  controller: currentController,
                  maxLines: null,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      if (newValue.text.isEmpty) return newValue;

                      final value = double.tryParse(newValue.text);
                      if (value == null || value > 10) return oldValue;

                      return newValue;
                    }),
                    FilteringTextInputFormatter.allow(RegExp(r'^\d{1,2}\.?\d{0,3}')),
                    LengthLimitingTextInputFormatter(6),
                  ],
                  cursorColor: Colors.grey.shade700,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: hintTexts[currentIndex.value],
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
                  onSubmitted: (_) => handleNext(),
                ),
              ),
              IconButton(
                onPressed: handleNext,
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
        ),
      ],
    );
  }
}