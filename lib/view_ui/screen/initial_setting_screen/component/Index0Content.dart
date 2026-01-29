
import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/svg_imoji.dart';

class Index0content extends HookConsumerWidget {

  final String text;
  final double iconSize;

  const Index0content({super.key, required this.text, required this.iconSize});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final isEmpty = text.isEmpty;
    final length = text.length;

    final displayText = switch (length) {
      0 => '정상근무 수당을 입력해주세요',
      >= 5 => '정상근무 수당 $text원',
      _ => '100,000원 이상 입력해주세요',
    };

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4.0),
          child: Row(
            children: [
              if (!isEmpty) ...[
                SvgImoJi(
                  nameLight: 'Rocket_new',
                  nameDark: 'rocket',
                  width: iconSize,
                ),
                SizedBox(width: 5),
              ],
              TextWidget(
                  displayText,
                  13.5,
                  context.width,color: context.subTextColor),
            ],
          ),
        ),
        SizedBox(height: 2.5),
      ],
    );
  }
}
