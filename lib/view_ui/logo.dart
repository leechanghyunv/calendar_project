import 'package:calendar_project_240727/core/export.dart';

Widget logo(double appWidth) => Padding(
  padding: EdgeInsets.all(appWidth > 500 ? 5.sp : 10.0.sp),
  child: Text('-----  L A F A Y E T T E  -----',
    style: TextStyle(
        fontSize: appWidth > 500 ? 7.sp : 12.5.sp,
        fontWeight: FontWeight.w900,
        letterSpacing: appWidth > 500 ? 5 : 3.5),
  ),
  );