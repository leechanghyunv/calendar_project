
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:intl/intl.dart';

import '../../core/export_package.dart';
import 'calendar_popupMenu.dart';
import 'range_picker_component/date_range_section.dart';

class CalendarHeader extends ConsumerWidget {

  final DateTime day;

  const CalendarHeader(this.day, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 4.0, top: 2.0, bottom: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 왼쪽에 날짜 표시
          Text(
            '${DateFormat.yMMMM('ko_KR').format(day)}',
            style: TextStyle(
              shadows: Platform.isAndroid ? [
                Shadow(
                  blurRadius: 0.75,
                  color: Colors.grey,
                  offset: Offset(0.25, 0.25),
                ),
              ] : null,
              fontSize: switch (appWidth) {
                > 450 => 23,
                > 420 => 22,
                > 400 => 21.5,
                _ => 20,
              },

              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          Row(
            children: [
              DateRangeButton(),
              SizedBox(width: appWidth > 400 ? 17.5 : 10),
              PopupWidget(),
              IconButton(
                icon: Icon(Icons.access_time,
                    size: appWidth > 400 ? 25 : 20),
                onPressed: () {
                  ref.timeNot.moveToToday();
                  customMsg('오늘날짜로');
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}