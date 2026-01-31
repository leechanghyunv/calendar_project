import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/extentions/theme_extension.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../core/widget/toast_msg.dart';

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
      FieldBarIndex.value = 3;
      currentNode.requestFocus();
      customMsg(hintTexts[3]);
    }


    // useEffect(() {
    //   final action = switch (currentIndex) {
    //     0 => () {
    //       // 정상근무 진입 시 로직
    //     },
    //     1 => () {
    //       // 연장근무 진입 시 로직
    //     },
    //     2 => () {
    //       // 야간근무 진입 시 로직
    //     },
    //     3 => () {
    //       // 세율 진입 시 로직
    //     },
    //     _ => () {},
    //   };
    //
    //   action();
    //   return null;
    // }, [currentIndex]);
    //

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
            onPressed: jumpToThird,
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
