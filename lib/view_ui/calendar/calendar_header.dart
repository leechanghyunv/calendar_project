import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import '../../core/export_package.dart';
import '../screen/default_screen.dart';
import 'header_component/filter_popupMenu.dart';
import 'header_component/month_move_popup.dart';
import 'header_component/calendar_popupMenu.dart';

class CalendarHeader extends ConsumerWidget {
  final DateTime day;

  const CalendarHeader(this.day, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = ref.watch(scaffoldKeyProvider);
    final appWidth = context.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        children: [
          ArrowDialogRow(day),

          Spacer(),

          GestureDetector(
            onTap: () => ref.timeNot.moveToToday(),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  width: 1.5,
                  color: context.isLight ? Colors.grey.shade900 : Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: TextWidget(
                  '${(DateTime.now().day).toString().padLeft(2, '0')}',
                  16,
                  appWidth,
                  color: context.isLight ? Colors.grey.shade800 : Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(width: appWidth > 400 ? 5 : null),
          SizedBox(width: appWidth > 450 ? 5 : null),

          PopupWidget(),

          SizedBox(width: appWidth > 400 ? 5 : null),
          SizedBox(width: appWidth > 450 ? 5 : null),

          SizedBox(width: 10),
          FilterPopupMenu(),
          SizedBox(width: 10),
          SizedBox(width: appWidth > 400 ? 5 : null),

          // SettingPopupWidget(),
        ],
      ),
    );
  }
}
