
import 'package:calendar_project_240727/core/export_package.dart';

import '../../../../base_app_size.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/svg_imoji.dart';

class Index1content extends HookConsumerWidget {

  final String text;
  final double iconSize;

  const Index1content({super.key, required this.text, required this.iconSize});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final length = text.length;

    final displayText = switch (length) {
      0 => '연장근무 수당을 입력해주세요',
      _ => '연장근무 수당 $text원',
    };


    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4.0),
          child: Row(
            children: [
              SvgImoJi(
                nameLight: 'Fire',
                nameDark: 'cuboid',
                width: iconSize,
              ),
              SizedBox(width: 5),
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

