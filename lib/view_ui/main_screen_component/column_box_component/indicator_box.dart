
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../minor_issue/widget/indicator_widget.dart';
import '../main_box_component/size_module/main_box_sizes.dart';
import 'animated_number.dart';


class BuildStateBox extends HookConsumerWidget {

  final double width;
  final double height;
  final String title;
  final double value;
  final bool type;
  final double progress;
  final Color progressColor;
  final String description;

  const BuildStateBox({super.key, required this.width, required this.height, required this.title, required this.value, required this.type, required this.progress, required this.progressColor, required this.description});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;
    final isFlip = ref.watch(isGalaxyFlipProvider);
    final isFlipValue = isFlip.asData?.value ?? false;


    return Container(
      decoration: context.boxDecoration,
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: LayoutBuilder(
            builder: (context, constraints){
              final appWidth = context.width;
              final heightValue = appWidth < 376 ? 3.0 : 4.0;

              final boxSizes = MainBoxSizes(
                width: appWidth,
                isFold: isFoldValue,
                isFlip: isFlipValue,

              );

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        title, 12, color: context.textColor,),
                      const Spacer(),
                      AnimatedNumber(
                        end: value,
                        type: type,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  IndicatorWidget(context.isDark, heightValue,constraints.maxWidth,
                      progress, progressColor),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      color: context.textColor,
                      height: textHeight,
                      fontWeight: context.isDark ? FontWeight.w600 : FontWeight.w500,
                      fontSize: boxSizes.indicatorFont,

                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
