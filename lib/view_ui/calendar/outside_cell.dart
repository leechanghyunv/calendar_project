
import 'package:calendar_project_240727/core/export_package.dart';


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
                fontSize: switch (appWidth) {
                  > 450 => 18.5,
                  > 400 => 17,
                  _ => 16,
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}



