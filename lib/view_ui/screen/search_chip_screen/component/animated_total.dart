
import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/utils/converter.dart';
import '../../../../core/widget/text_widget.dart';

class AnimatedTotal extends ConsumerWidget {
  final int start;
  final int end;
  final Duration duration;


  const AnimatedTotal({
    super.key,
    this.start = 0,
    required this.end,
    this.duration = const Duration(milliseconds: 500),

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: start, end: end),
      duration: duration,
      builder: (context, value, child) {

        final displayText = formatAmount(value);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedEmoji(
              AnimatedEmojis.coin,
              repeat: true,
              animate: true,
              size: 20,
            ),
            SizedBox(width: 7.5),
            TextWidget(displayText, 15,
                context.width,color: context.subTextColor),
          ],
        );
      },
    );


  }
}
