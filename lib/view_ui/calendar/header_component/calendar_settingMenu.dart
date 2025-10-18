import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../screen/calendar_screen/provider/popup_menu_provider.dart';
import '../../screen/range_history_screen/component/range_history_modal_component.dart';
import '../../screen/setting_screen/setting_modal.dart';
import '../../screen/user_statistics_screen/component/auth_modal_component.dart';
import '/core/export_package.dart';


class SettingPopupWidget extends ConsumerWidget {
  const SettingPopupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final appWidth = context.width;

    TextStyle getStyle = TextStyle(
      fontSize: appWidth > 450 ? 14 : 13,
      color: context.isLight ? Colors.grey.shade900 : Colors.grey.shade100,
      fontWeight: FontWeight.w600,
    );

    return PopupMenuButton<String>(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
            width: 0.5,
            color: Colors.grey.shade200),
      ),
      offset: Offset(230, 40),
      icon: Icon(
        Icons.menu,
        size: appWidth >= 450
            ? 30
            : appWidth > 400
                ? 27
                : 25,
      ),
      onOpened: () => ref.read(popupMenuOpenProvider.notifier).open(),
      onCanceled: () => ref.read(popupMenuOpenProvider.notifier).close(),
      onSelected: (value) {
        ref.read(popupMenuOpenProvider.notifier).close();
        switch (value) {
          case 'erase':
            showRangeModal(context,ref);
            break;
          case 'enroll':
            showBasicModal(context,false);
            break;
          case 'settings':
            showSettingModal(context);
            break;
        }
      },

      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'erase',
          height: 30,
          child: CalendarSettingBox('근로기간 설정하기', getStyle),
        ),
        PopupMenuDivider(
          color: context.isDark ? Colors.grey.shade600 : null,
        ),
        PopupMenuItem(
          value: 'enroll',
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(textScaler: TextScaler.noScaling,
                        '근로조건 설정하기',
                        style: getStyle),
                  ],
                ),
              ],
            ),
          ),

        ),
        PopupMenuDivider(
          color: context.isDark ? Colors.grey.shade600 : null,
        ),
        PopupMenuItem(
          value: 'settings',
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child:  Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text(
                        textScaler: TextScaler.noScaling,
                        '기본설정 변경하기',
                        style: getStyle),

                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget CalendarSettingBox(String msg, TextStyle getStyle,
    {bool? isSetting = false}) {
  return Container(
    decoration: BoxDecoration(
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
