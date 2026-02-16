import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../base_app_size.dart';
import '../../../../core/dark_light/dark_light.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/extentions/theme_extension.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/svg_imoji.dart';
import '../provider/settlement_state_provider.dart';
import '../provider/work_site_provider.dart';

class LatestRecordButton extends HookConsumerWidget {
  final TextEditingController textController;
  final TextEditingController decimalController;

  const LatestRecordButton({
    super.key,
    required this.textController,
    required this.decimalController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return GestureDetector(
      onTap: () async {
        final latest = await ref.watch(latestHistoryProvider.future);
        HapticFeedback.selectionClick();
        textController.text = latest.memo;
        decimalController.text = latest.record.toString();
        ref.read(isSettlementProvider.notifier).state = latest.settlement;
        // ref.read(selectedWorksiteProvider.notifier).state = latest.workSite;
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          child: Row(
            children: [

              // SvgPicture.asset(
              //   'assets/cuboid.svg',
              //   width: context.width.responsiveSize([13.5, 12, 11.5, 11.5,10.5,9]),
              //   colorFilter:ColorFilter.mode(
              //     context.isDark ? LightDarkMode.darkTextMain : Colors.grey.shade700,
              //     BlendMode.srcIn,
              //   ),
              //
              // ),
              // SizedBox(width: 2.5,),
              TextWidget(
                ' @ 최근기록 ',
                13,
                context.width,
                color: context.subTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
