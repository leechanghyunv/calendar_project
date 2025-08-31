
import '../../../core/export_package.dart';
import '../../../theme_color.dart';
import '../../minor_issue/widget/indicator_widget.dart';
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
}) {
  return Container(

    decoration: MainBoxDecoration,
    width: width,
    height: height,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
          builder: (context, constraints){

            final appWidth = MediaQuery.of(context).size.width;
            final heightValue = appWidth < 376 ? 3.0 : 4.0;

            final double font = switch (appWidth) {
              > 400 => 10.5,
              > 400 => 10.5,
              < 376 => 8.0,
              _ => 9.0
            };

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title,
                        textScaler: TextScaler.noScaling,
                        style:  TextStyle(
                        height: textHeight,
                        fontWeight: FontWeight.bold,
                        fontSize: appWidth > 450 ? 13 : 12)),
                    const Spacer(),
                    AnimatedNumber(
                      end: value,
                      type: type,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                IndicatorWidget(heightValue,constraints.maxWidth,
                    progress, progressColor),
                const SizedBox(height: 5),
                Text(description,
                  textScaler: TextScaler.noScaling,
                    style: TextStyle(
                        height: textHeight,
                        fontWeight: FontWeight.w500,
                        fontSize: font),
                ),
              ],
            );
          }
      ),
    ),
  );
}

BoxDecoration get MainBoxDecoration => BoxDecoration(
  color: boxColor,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ],
);

BoxDecoration get UserSettingBoxDecoration => BoxDecoration(
  color: Colors.grey.shade100,
  borderRadius: BorderRadius.circular(12),
  border: Border.all(
    width: 0.75,
    // color: Colors.grey.shade300,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ],
);
