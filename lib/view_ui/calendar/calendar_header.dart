import 'package:calendar_project_240727/base_consumer.dart';
import 'package:intl/intl.dart';
import '../../core/export_package.dart';
import '../../view_model/view_provider/calendar_switcher_model.dart';
import 'calendar_popupMenu.dart';

class CalendarHeader extends ConsumerWidget {

  final DateTime day;

  const CalendarHeader(this.day, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
          left: appHeight > 750 ? 16.0 : 12.0, right: 4.0, top: 2.0, bottom: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${DateFormat.yMMMM('ko_KR').format(day)}',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              shadows: Platform.isAndroid ? [
                Shadow(
                  blurRadius: 0.75,
                  color: Colors.grey,
                  offset: Offset(0.25, 0.25),
                ),
              ] : null,
              fontSize: switch (appWidth) {
                > 450 => 25,
                > 420 => 22,
                > 400 => 21.5,
                _ => 19.5,
              },
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          Row(
            children: [
              SizedBox(width: appWidth > 400 ? 17.5 : 10),
              PopupWidget(),
              SizedBox(width: appWidth > 450 ? 10 : null),
              IconButton(
                onPressed: () => ref.timeNot.moveToToday(),
                icon: Icon(
                  Icons.calendar_today_outlined,
                  size: appWidth >= 450 ? 27.5 : appWidth > 400 ? 25 : 22.5,
              ),
              ),

              SizedBox(width: appWidth > 450 ? 10 : null),

              IconButton(
                icon: Icon(Icons.remove_red_eye_outlined,
                    size: appWidth >= 450 ? 30 : appWidth > 400 ? 27.5 : 25,
                ),
                onPressed: () {
                  ref.read(calendarSwitcherProvider.notifier).toggle();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}