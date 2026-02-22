import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/widgets/svg_imoji.dart';

import '../../base_app_size.dart';
import '../../base_consumer.dart';
import '../../core/extentions/theme_color.dart';
import '../../core/extentions/theme_extension.dart';
import '../../core/utils/converter.dart';
import '../../core/widget/text_widget.dart';
import '../../repository/formz/formz_decimal.dart';
import '../screen/contract_setting_screen/component/latest_record_button.dart';
import 'blink_text.dart';

final memoActiveProvider = StateProvider<bool>((ref) => false);

class DualFieldBar extends HookConsumerWidget {
  final ValueNotifier<DateTime> selectedDate;
  final ValueNotifier<DateTime> endDate;
  final ValueNotifier<bool> isDuration;
  final TextEditingController textController;
  final TextEditingController decimalController;
  final FocusNode textFocusNode;
  final FocusNode decimalFocusNode;

  const DualFieldBar({
    super.key,
    required this.selectedDate,
    required this.endDate,
    required this.isDuration,
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

    ref.watch(formzDecimalValidatorProvider);
    ref.formzMemoWatch;
    ref.decimalWatch;

    useEffect(() {
      decimalFocusNode.requestFocus();
      return null;
    }, [isActive]);

    ref.listen(memoActiveProvider, (previous, next) {
      if (next) {
        customMsg('메모입력창 전환');
        textFocusNode.requestFocus();
      } else {
        customMsg('공수입력창 전환');
        decimalFocusNode.requestFocus();
      }
    });

    useEffect(() {
      final sub = ref.listenManual(
        formzDecimalValidatorProvider,
            (prev, next) {
          if (next.status == DecimalFormzStatus.submissionSuccess) {
            ref.refreshState(context);
            if (context.mounted && Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          }
        },
      );
      return sub.close;
    }, []);


    final decimalText = useListenable(decimalController).text;
    final decimal = double.tryParse(decimalText) ?? 0.0;

    final calculatedPay = useMemoized(() {
      if (decimalText.isEmpty) return 0.0;
      return (contractPay + contractSubsidy) * decimal;
    }, [decimalText, contractPay,contractSubsidy]);

    final String totalString = contractSubsidy != 0
        ?  calculatedPay == 0 ? '휴일로 등록 하시겠습니까?' : ' 일비포함 ${formatAmount(calculatedPay.toInt())} 입니다.'
        : calculatedPay == 0 ? '휴일로 등록 하시겠습니까?' : ' ${formatAmount(calculatedPay.toInt())} 입니다.';

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
                  Icon(Icons.more_horiz,color: context.subTextColor,size: 17.5),

                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  BlinkTwiceText(
                    "휴일처리는 숫자 '0' 입력 후 확인",
                    13.5,
                    color: context.subTextColor,
                  ),
                  Spacer(),
                  LatestRecordButton(
                    textController: textController,
                    decimalController: decimalController,

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
                      hintText: isActive ? ' 메모를 입력해주세요' : ' 예) 1.25 ',
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
                      ref.formzMemoRead.onChangeMemo(textController.text);
                      ref.read(memoActiveProvider.notifier).state = !isActive;
                      HapticFeedback.selectionClick();
                    } else {
                      ref.decimalRead.onChangeDecimal(decimal);
                      if (isDuration.value) {
                        ref.decimalRead.onSubmitMonthAll(
                          selectedDate.value,endDate.value,
                        );
                      }
                      ref.decimalRead.onSubmit(decimal: decimal);
                      HapticFeedback.selectionClick();
                    }
                  },
                  icon: Icon(
                    isActive ? Icons.arrow_forward : Icons.check,
                    color: context.isDark
                        ? (textController.text.length >= 1 || decimalController.text.length >= 1) ? Colors.white : Colors.grey.shade700
                        : (textController.text.length >= 1 || decimalController.text.length >= 1) ? Colors.teal.shade700 : Colors.grey.shade400,
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
