import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/blink_threeTimes_text.dart';
import '../../../widgets/svg_imoji.dart';
import 'index0selectChip.dart';

class Index0content extends HookConsumerWidget {
  final String text;
  final double iconSize;
  final GestureTapCallback? onTap;
  final int selectedAmount; // 👈 추가
  final ValueChanged<int> onAmountSelected; // 👈 추가

  const Index0content({super.key, required this.text, required this.iconSize, this.onTap, required this.selectedAmount, required this.onAmountSelected});

  List<Map<String, dynamic>> chipList(BuildContext context) {
    final numValue = int.tryParse(text.replaceAll(',', '')) ?? 0;
    final extended = (numValue * 1.5).toInt();
    final night = (numValue * 2).toInt();

    return [
      {
        'value': '정상 수당 $text원',
        'icon': context.isDark ? 'rocket' : 'Rocket_new',
      },
      {
        'value': '연장 수당 ${extended.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}원',
        'icon': context.isDark ? 'cuboid' : 'Fire',
      },
      {
        'value': '야간 수당 ${night.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}원',
        'icon': context.isDark ? 'zap' : 'Party',
      },
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEmpty = text.isEmpty;
    final length = text.length;

    final showFirst = useState(false);
    final showSecond = useState(false);
    final showThird = useState(false);

    useEffect(() {
      if (length == 7) {
        Future.delayed(Duration(milliseconds: 400), () {
          if (context.mounted) showFirst.value = true;
        });
        Future.delayed(Duration(milliseconds: 800), () {
          if (context.mounted) showSecond.value = true;
        });
        Future.delayed(Duration(milliseconds: 1200), () {
          if (context.mounted) showThird.value = true;
        });
      } else {
        showFirst.value = false;
        showSecond.value = false;
        showThird.value = false;
      }
      return null;
    }, [length]);

    final displayText = switch (length) {
      0 => '정상근무 수당을 입력해주세요',
      >= 5 => chipList(context)[0]['value'],
      _ => '100,000원 이상 입력해주세요',
    };

    final chips = chipList(context);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildRow(context, displayText, isEmpty, iconSize, chips[0]['icon']),

            // if(length == 0)
            //   Expanded(
            //     child: PayChipsIndex0(
            //       selectedValue: selectedAmount,
            //       onSelected: onAmountSelected,
            //     ),
            //   ),
          ],
        ),

        SizedBox(height: 2.5),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: showFirst.value ? 1.0 : 0.0,
            child: showFirst.value
                ? _buildRow(context, chips[1]['value'], isEmpty, iconSize, chips[1]['icon'])
                : SizedBox.shrink(),
          ),
        ),
        SizedBox(height: 2.5),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: showSecond.value ? 1.0 : 0.0,
            child: showSecond.value
                ? Column(
                  children: [
                    _buildRow(context, chips[2]['value'], isEmpty, iconSize, chips[2]['icon']),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: .end,
                        children: [
                        ],
                      ),
                    ),
                  ],
                )
                : SizedBox.shrink(),
          ),
        ),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: showThird.value ? 1.0 : 0.0,
            child: showThird.value
                ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                crossAxisAlignment: .end,
                children: [
                  Spacer(),
                  GestureDetector(
                      onTap: onTap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              BlinkThreeTimesText('수당 정보가 틀리다면?', 13.5,color: context.subTextColor),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            )
                : SizedBox.shrink(),
          ),

        ),

      ],
    );
  }

  Widget _buildRow(BuildContext context, String text, bool isEmpty, double iconSize, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      child: Row(
        children: [
          if (!isEmpty) ...[
            ChipImoJi(
              name: icon,
              width: iconSize,
            ),
            SizedBox(width: 5),
          ],
          TextWidget(text, 13.5, context.width, color: context.subTextColor),
        ],
      ),
    );
  }
}