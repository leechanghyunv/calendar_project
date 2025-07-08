import '../../../../core/export_package.dart';
import '../../../../theme_color.dart';

Widget siteBox(BuildContext context, String siteName, IconData icon, {bool isSelected = false}) {
  final  height = MediaQuery.of(context).size.height;
  final  width = MediaQuery.of(context).size.width;
  return Container(
    width: height > 750 ? (width > 450 ? 100 : width > 400 ? 90 : (width > 370 ? 80 : 75)) : 77,
    height: height > 750 ? (width > 450 ? 90 : width > 400 ? 85 : 75) : 70,
    decoration: BoxDecoration(
      color: isSelected ? Colors.grey.shade50 : Colors.grey.shade50,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: isSelected ? Colors.black : Colors.black,
        width: isSelected ? 1.5 : 0.25,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, size:  height > 750 ? (width > 400 ? 35 : 30) : 28,
            color: isSelected ? Colors.black : Colors.black,

          ),
          Spacer(),
          Text(
            siteName,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.black,

              fontSize: height > 750 ? (width > 400 ? 16 : (width < 370 ? 14 : 15)) : 13.5,
              fontWeight: Platform.isAndroid ? FontWeight.w600 : FontWeight.w800,
            ),
          ),
          Spacer(),
        ],
      ),
    ),
  );
}


Widget greyBox(String text,double height,double width) => _buildStyledBox(
  text: text,
  backgroundColor: Colors.grey.shade200,
  borderColor: Colors.grey,
  textColor: Colors.black,
  height: height,
  width: width,
  borderWidth: 1.25,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade100,
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ],
);

Widget _buildStyledBox({
  required String text,
  required Color backgroundColor,
  required Color borderColor,
  required Color textColor,
  required double height,
  required double width,
  double borderWidth = 0.25,
  List<BoxShadow>? boxShadow,
}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
      boxShadow: boxShadow,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: width < 370 ? 4.0 : 8.0),
      child: Text(
        text,
        textScaler: TextScaler.noScaling,
        style: TextStyle(
          height: textHeight,
          fontSize: height > 750
              ? (width > 400 ? 14.5 : (width < 370 ? 12.5 : 13.5))
              : 12.5,
          fontWeight: Platform.isAndroid ? FontWeight.bold : FontWeight.w900,
          color: textColor,
        ),
      ),
    ),
  );
}
