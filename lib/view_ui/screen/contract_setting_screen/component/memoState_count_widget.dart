import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';
import '../../../../core/utils/converter.dart';
import '../../../../core/widget/text_widget.dart';
import '../provider/memoState_count_provider.dart';

class MemoStateCountWidget extends HookConsumerWidget {

  final int normal;

  const MemoStateCountWidget({super.key, required this.normal});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final showIntro = ref.watch(memoStateOpenProvider);

    return showIntro.when(
        data: (isIntro) => isIntro
            ? TextWidget('일당 ${formatAmount(normal)}', 16, context.width, color: context.textColor)
            : TextWidget('일당 ${formatAmount(normal)}', 16, context.width, color: context.textColor),
        error: (err,trace) => TextWidget('일당 ${formatAmount(normal)}', 16, context.width, color: context.textColor),
        loading: () => TextWidget('일당 ${formatAmount(normal)}', 16, context.width, color: context.textColor),
    );
  }
}
