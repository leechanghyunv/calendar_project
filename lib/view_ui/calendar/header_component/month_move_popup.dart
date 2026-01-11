import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import '../../dialog/month_move_dialog/month_move_dialog.dart';
import 'package:intl/intl.dart';
import 'calendar_settingMenu.dart';

class ArrowDialogRow extends HookConsumerWidget {

  final DateTime day;

  const ArrowDialogRow(this.day, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final isDialogOpen = useState(false); // dialog 열림 상태 관리
    final appWidth = MediaQuery.of(context).size.width;

    Future<void> showMyDialog() async {
      isDialogOpen.value = true;
      await context.dialog(MonthMoveDialog());
      isDialogOpen.value = false;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          SettingPopupWidget(),
          SizedBox(width: context.width > 400 ? 15 : 10),
          GestureDetector(
            onTap: showMyDialog,
            child: Row(
              children: [
                Text(
                  DateFormat('yyyy.MM').format(day), /// 2025.12
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    shadows: Platform.isAndroid
                        ? [
                      const Shadow(
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
                      _ => 20,
                    },
                    fontWeight: FontWeight.w800,
                  ),
                ),
                AnimatedRotation(
                  turns: isDialogOpen.value ? 0.5 : 0, // 0.5 = 180도
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 25.5,
                    color: isLight ? Colors.grey.shade800 : Colors.grey.shade100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
