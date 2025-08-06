import 'package:calendar_project_240727/base_consumer.dart';
import 'package:intl/intl.dart';
import '../../core/export_package.dart';
import 'calendar_popupMenu.dart';
import 'calendar_settingMenu.dart';

class CalendarHeader extends ConsumerWidget {
  final DateTime day;

  const CalendarHeader(this.day, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
          left: appHeight > 750 ? 16.0 : 12.0,
          right: 4.0,
          top: 2.0,
          bottom: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 3,
            height: 20,
            color: Colors.green,
          ),
          SizedBox(width: 5.5),
          Text(
            '${DateFormat.yMMMM('ko_KR').format(day)}',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              shadows: Platform.isAndroid
                  ? [
                      Shadow(
                        blurRadius: 0.75,
                        color: Colors.grey,
                        offset: Offset(0.25, 0.25),
                      ),
                    ]
                  : null,
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
          Spacer(),

          GestureDetector(
            onTap: () => ref.timeNot.moveToToday(),
            child: Container(
              height: appWidth >= 450 ? 27 : appWidth > 400 ? 25 : 22.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                    width: 1.5,
                    color: Colors.grey.shade900),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 4.0),
                child: Text(
                  '${(DateTime.now().day).toString().padLeft(2, '0')}',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    fontSize: appWidth >= 450 ? 17 : 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(width: appWidth > 450 ? 10 : null),
          PopupWidget(),
          SizedBox(width: appWidth > 450 ? 10 : null),
          SettingPopupWidget(),



        ],
      ),
    );
  }
}
