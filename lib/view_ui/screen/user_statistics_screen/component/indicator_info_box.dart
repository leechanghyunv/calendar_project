import 'package:calendar_project_240727/repository/repository_import.dart';

class IndicatorInfoBox extends StatelessWidget {
  // final String svg;
  final String name;
  final String unit;
  final String value;
  final String text;

  const IndicatorInfoBox({
    super.key,
    // required this.svg,
    required this.name,
    required this.unit,
    required this.value,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height > 750 ? (width > 400 ? 145.0 : (width < 375 ? 130.0 : 140.0)) : 125,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade900,
          width: 0.35,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: height > 750 ? (width > 400 ? 15.0 : (width < 370 ? 12.0 : 14.0)) : 12.0,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            ///
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  value,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(

                    fontSize: height > 750 ? (width >= 450 ? 36 : width > 400 ? 33.0 : (width < 370 ? 30.0 : 32.0)) : 26.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, right: 1.0),
                  child: Text(unit,
                      textScaler: TextScaler.noScaling,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: height > 700 ? (width >= 450 ? 15 : width > 400 ? 14.5 : 14.0) : 12.0,
                      )),
                ),

              ],
            ),
            ///
            Text(
              text,
              maxLines: 2,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: height > 750
                    ? (width >= 450
                    ? 11.0
                    : width > 400
                    ? 10.0
                    : width < 370
                    ? 8.5
                    : 9.5)
                    : 8.25,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
