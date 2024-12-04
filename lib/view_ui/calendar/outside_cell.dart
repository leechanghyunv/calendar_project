
import 'package:calendar_project_240727/core/export_package.dart';

import 'blink_pointer.dart';

class OutSideCell extends StatelessWidget {

  final DateTime day;

  const OutSideCell({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    bool hasMarker = day.weekday ==
        DateTime.saturday; // Example condition for markers
    return Container(
      margin:  EdgeInsets.all(4.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: hasMarker ? Colors.blue : Colors.grey,
                fontSize: appWidth > 500 ? 8.sp :16.sp,
              ),
            ),
          ),
          if (hasMarker)
            Positioned(
              right: 1,
              bottom: 1,
              child: BlinkPointer(),
            ),
        ],
      ),
    );
  }
}



