
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../minor_issue/widget/indicator_widget.dart';
import '../main_box_component/main_box_sizes.dart';
import 'animated_number.dart';

Widget buildStatsBox({
  required double width,
  required double height,
  required String title,
  required double value,
  required bool type,
  required double progress,
  required Color progressColor,
  required String description,
  required BuildContext context,
}) {


  return Container(
    decoration: context.boxDecoration,
    width: width,
    height: height,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
          builder: (context, constraints){
            final appWidth = MediaQuery.of(context).size.width;
            final heightValue = appWidth < 376 ? 3.0 : 4.0;

            final boxSizes = MainBoxSizes(
              width: appWidth,
            );

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(title, 12, appWidth,color: context.textColor,),
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
                Text(description,
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


