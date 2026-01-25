import '../../base_app_size.dart';
import '../../core/export_package.dart';
import '../../core/extentions/theme_color.dart';
import '../../core/extentions/theme_extension.dart';
import '../../core/widget/toast_msg.dart';
import '../../view_model/view_provider/display_view_record_model.dart';

class MultiDecimalFieldBar extends HookConsumerWidget {
  final List<TextEditingController> controllers;
  final List<String> hintTexts;
  final ValueChanged<int>? onChange;
  final VoidCallback? onComplete;
  final ValueNotifier<int> currentIndexNotifier;

  const MultiDecimalFieldBar({
    super.key,
    required this.controllers,
    required this.hintTexts,
    this.onChange,
    this.onComplete,
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
        customMsg('리스트에 반영되었습니다');
        onComplete?.call();


        currentIndex.value = 0;
        ref.invalidate(displayValueProvider);

      } else {
        final labels = ['연장근무 자리 입력', '야간근무 자리 입력'];
        customMsg('${labels[currentIndex.value]}');
        currentIndex.value++;
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
              onChanged: (val){
                onChange?.call(currentIndexNotifier.value);
              },
              onSubmitted: (_) => handleNext(),
            ),
          ),
          IconButton(
            onPressed: handleNext,
            icon: Icon(
              isLast ? Icons.check : Icons.arrow_forward,
              color: context.isDark ? Colors.white : Colors.teal.shade700,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}