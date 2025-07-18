import '../../core/export_package.dart';
import '../../view_model/view_provider/calendar_switcher_model.dart';
import '../dialog/basic_setting_dialog/basic_setting_dialog.dart';
import '../dialog/delete_goal_dialog/delete_dialog.dart';
import '../screen/user_statistics_screen/component/auth_modal_component.dart';

class SettingPopupWidget extends ConsumerWidget {
  const SettingPopupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;

    TextStyle getStyle = TextStyle(
      fontSize: appWidth > 450 ? 14 : 13,
      color: Colors.grey.shade900,
      fontWeight: FontWeight.w600,
    );

    return PopupMenuButton<String>(
      offset: Offset(230, 40),
      icon: Icon(
        Icons.menu,
        size: appWidth >= 450
            ? 30
            : appWidth > 400
                ? 27
                : 25,
      ),
      onSelected: (value) {
        switch (value) {
          case 'erase':
            showDialog(
              context: context,
              builder: (context) => DeleteDialog(),
            );
            break;
          case 'enroll':
            showBasicModal(context,false);
            break;
          case 'settings':
            ref.read(calendarSwitcherProvider.notifier).toggle();
            break;
          case 'theme':
            showDialog(
              context: context,
              builder: (context) => BasicSettingDialog(),
            );
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'erase',
          height: 30,
          child: CalendarSettingBox('공수삭제 범위설정', getStyle),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: 'enroll',
          height: 30,
          child: CalendarSettingBox('근로조건 설정하기', getStyle),

        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: 'settings',
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        textScaler: TextScaler.noScaling,
                        '캘린더모드 변경',
                        style: getStyle),
                  ],
                ),
                Text(
                  '메모기록포함 & 제외',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    fontSize: appWidth > 450 ? 12 : 10,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: 'theme',
          height: 30,
          child: CalendarSettingBox('기본공수 변경', getStyle),
        ),
      ],
    );
  }
}

Widget CalendarSettingBox(String msg, TextStyle getStyle,
    {bool? isSetting = false}) {
  return Container(
    decoration: BoxDecoration(
      // color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(6),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(textScaler: TextScaler.noScaling, msg, style: getStyle),
      ],
    ),
  );
}
