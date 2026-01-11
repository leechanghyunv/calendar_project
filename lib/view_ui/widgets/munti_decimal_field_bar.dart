import '../../core/export_package.dart';
import '../../core/extentions/theme_color.dart';
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

    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, [currentIndex.value]);

    final currentController = controllers[currentIndex.value];
    final isLast = currentIndex.value == controllers.length - 1;

    void handleNext() {
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
      height: 50,
      decoration: BoxDecoration(
        color: context.isDark ? Colors.black87 : Colors.grey[100],
        border: Border.all(
          color: context.isDark ? Colors.white : Colors.white,
          width: context.isDark ? 0.75 : 0.35,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
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
          fontSize: 15,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: handleNext,
            icon: Icon(
              isLast ? Icons.check : Icons.arrow_forward,
              color: context.isDark ? Colors.white : Colors.teal.shade700,
              size: 25,
            ),
          ),
          isDense: true,
          hintText: hintTexts[currentIndex.value],
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 15,
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
    );
  }
}