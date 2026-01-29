
import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/svg_imoji.dart';

class Index3content extends HookConsumerWidget {

  final String text;
  final double iconSize;

  const Index3content({super.key, required this.text, required this.iconSize});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final length = text.length;

    final displayText = switch (length) {
      0 => '미등록시 3.3%적용',
      _ => '세율 $text%',
    };


    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4.0),
          child: Row(
            children: [
              // SvgImoJi(
              //   nameLight: 'Rocket_new',
              //   nameDark: 'rocket',
              //   width: iconSize,
              // ),
              // SizedBox(width: 5),
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
