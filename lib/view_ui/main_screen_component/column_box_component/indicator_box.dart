
import '../../../core/export_package.dart';
import '../../../theme_color.dart';
import '../../minor_issue/widget/indicator_widget.dart';

Widget buildStatsBox({
  required double width,
  required double height,
  required String title,
  required String value,
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
            final heightVlaue = appWidth < 376 ? 3.0 : 4.0;
            final font = appWidth < 376 ? 8.0 : appWidth > 400 ? 10.5 : 9.0;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(title, style:  TextStyle(
                        height: textHeight,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                    const Spacer(),
                    Text(value, style: TextStyle(
                        height: textHeight,
                        fontWeight: FontWeight.bold, color: Colors.grey.shade700,
                        fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 5),
                IndicatorWidget(heightVlaue,constraints.maxWidth,
                    progress, progressColor),
                const SizedBox(height: 5),
                Text(description,
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
