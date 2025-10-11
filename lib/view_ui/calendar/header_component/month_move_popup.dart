import 'package:calendar_project_240727/core/export_package.dart';
import '../../dialog/month_move_dialog/month_move_dialog.dart';
import 'package:intl/intl.dart';

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

      await showDialog(
        context: context,
        builder: (context) => MonthMoveDialog(),
      );

      isDialogOpen.value = false;
    }

    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: showMyDialog,
          child: Row(
            children: [
              Text(
                '${DateFormat.yMMMM('ko_KR').format(day)}',
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
              const SizedBox(width: 2.5),
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
      ),
    );
  }
}
