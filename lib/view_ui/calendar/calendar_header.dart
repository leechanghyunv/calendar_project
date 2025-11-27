import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../core/export_package.dart';
import '../screen/default_screen.dart';
import 'header_component/month_move_popup.dart';
import 'header_component/calendar_popupMenu.dart';
import 'header_component/calendar_settingMenu.dart';

class CalendarHeader extends ConsumerWidget {
  final DateTime day;

  const CalendarHeader(this.day, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final scaffoldKey = ref.watch(scaffoldKeyProvider);
    final appWidth =  context.width;

    return Padding(
      padding: EdgeInsets.only(
          left: 4.0,
          right: 4.0,
          top: Platform.isAndroid ? 6.0 : 2.0,
          bottom: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ArrowDialogRow(day),

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
                    color: context.isLight ?  Colors.grey.shade900 : Colors.white,
                ),
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
                    color: context.isLight ?  Colors.grey.shade800 : Colors.white,
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
