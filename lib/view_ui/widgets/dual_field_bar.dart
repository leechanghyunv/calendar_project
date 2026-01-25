import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/widgets/svg_imoji.dart';

import '../../base_app_size.dart';
import '../../core/extentions/theme_color.dart';
import '../../core/extentions/theme_extension.dart';
import '../../core/utils/converter.dart';
import '../../core/widget/text_widget.dart';

final memoActiveProvider = StateProvider<bool>((ref) => false);

class DualFieldBar extends HookConsumerWidget {
  // final DateTime selectedDate;
  // final DateTime endDate;
  final TextEditingController textController;
  final TextEditingController decimalController;
  final FocusNode textFocusNode;
  final FocusNode decimalFocusNode;

  const DualFieldBar({
    super.key,
    // required this.selectedDate,
    // required this.endDate,
    required this.textController,
    required this.decimalController,
    required this.textFocusNode,
    required this.decimalFocusNode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final fontSize = context.width.responsiveSize([15, 14.5, 14, 14, 13.5, 13]);
    final iconSize = context.width.responsiveSize([25, 24, 24, 23, 21, 18.5]);

    final isActive = ref.watch(memoActiveProvider);

    final contract = ref.watch(viewContractProvider);
    final contractPay = contract.valueOrNull?.lastOrNull?.normal ?? 0.0;
    final contractSubsidy = contract.valueOrNull?.lastOrNull?.subsidy ?? 0.0;

    useEffect(() {
      decimalFocusNode.requestFocus();
      return null;
    }, [isActive]);

    ref.listen(memoActiveProvider, (previous, next) {
      if (next) {
        customMsg('메모입력 으로 전환');
        textFocusNode.requestFocus();
      } else {
        decimalFocusNode.requestFocus();
      }
    });

    final decimalText = useListenable(decimalController).text;

    final calculatedPay = useMemoized(() {
      if (decimalText.isEmpty) return 0.0;
      final decimal = double.tryParse(decimalText) ?? 0.0;
      return (contractPay + contractSubsidy) * decimal;
    }, [decimalText, contractPay,contractSubsidy]);

    final String totalString = contractSubsidy != 0
        ?  ' 일비포함 ${formatAmount(calculatedPay.toInt())} 입니다.'
        : ' ${formatAmount(calculatedPay.toInt())} 입니다.';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          if (decimalText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0.0),
              child: Row(
                children: [
                  SvgImoJi(
                    nameLight: 'Rocket_new',
                    nameDark: 'rocket',
                    width: 13.5,
                  ),
                  SizedBox(width: 5),
                  TextWidget(
                      totalString,
                      13.5,
                      context.width,
                      color: context.subTextColor
                  ),
                  Spacer(),

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
                    key: ValueKey(isActive),
                    controller: isActive ? textController : decimalController,
                    focusNode: isActive ? textFocusNode : decimalFocusNode,
                    maxLines: null,
                    keyboardType: isActive ? TextInputType.text : TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                    inputFormatters: isActive ? null : [
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
                      hintText: isActive ? ' 메모를 입력해주세요' : ' 예) 1.25',
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
                  onPressed: () {
                    if (isActive) {
                      ref.read(memoActiveProvider.notifier).state = !isActive;
                      HapticFeedback.selectionClick();
                    } else {
                      // false일 때 동작 (필요시 추가)
                    }
                  },
                  icon: Icon(
                    isActive ? Icons.arrow_forward : Icons.check,
                    color: context.isDark ? Colors.white : Colors.teal.shade700,
                    size: iconSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
