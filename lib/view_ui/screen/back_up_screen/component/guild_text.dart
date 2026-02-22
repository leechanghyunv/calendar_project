
import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/core/export_package.dart';

import '../../../../base_app_size.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';

Widget GuildText (BuildContext context,String msg) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 6.0,
        vertical: 6.0),
    child: Row(
      children: [
        AnimatedEmoji(
          AnimatedEmojis.lightBulb,
          repeat: true,
          animate: true,
          size: 15,
        ),
        SizedBox(width: 3.5),
        Expanded(
          child: TextWidget(msg,
              13.5, context.width,color: context.textColor),
        )
      ],
    ),
  );
}