import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/blink_text.dart';
import '../../../widgets/blink_threeTimes_text.dart';
import '../../../widgets/svg_imoji.dart';
import 'index0selectChip.dart';

class Index0content extends HookConsumerWidget {
  final String text;
  final double iconSize;
  final GestureTapCallback? onTap;

  const Index0content({super.key, required this.text, required this.iconSize, this.onTap});

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

    useEffect(() {
      if (length == 7) {
        Future.delayed(Duration(milliseconds: 500), () {
          if (context.mounted) showFirst.value = true;
        });
        Future.delayed(Duration(seconds: 1), () {
          if (context.mounted) showSecond.value = true;
        });
      } else {
        showFirst.value = false;
        showSecond.value = false;
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
            Spacer(),
            if(length == 0)
              Expanded(
                child: PayChipsIndex0(
                  selectedValue: 150000,
                  onSelected: (value) {
                    print(value);
                  },
                ),
              ),
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
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                            onTap: onTap,
                            child: BlinkThreeTimesText('연장야간 직접입력', 12,color: context.subTextColor)),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 5.0),
                  ],
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