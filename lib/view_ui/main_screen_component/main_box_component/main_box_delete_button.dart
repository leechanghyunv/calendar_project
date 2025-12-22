import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../screen/calendar_screen/provider/delete_count_provider.dart';

class DeleteChip extends HookConsumerWidget {
  const DeleteChip({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final borderWidth = useState(0.75);
    final isLight = Theme.of(context).brightness == Brightness.light;

    final data = ref.history;
    final appWidth = context.width;
    final tapCount = ref.watch(deleteTapCountProvider);

    useEffect(() {
      Future.microtask(
          () => ref.read(deleteTapCountProvider.notifier).loadCount());
      return null;
    }, []);

    final handleTap = useCallback(() async {
      HapticFeedback.selectionClick();
      borderWidth.value = 1.25;
      await ref.read(deleteTapCountProvider.notifier).increment();
      switch (data) {
        case AsyncData(:final value):
          final selectedOne =
              value.where((e) => e.date.toUtc() == ref.selected);
          if (selectedOne.isEmpty) {
            customMsg('${ref.selected.month}월 ${ref.selected.day}일 공수가 없습니다.');
          } else {
            await ref.read(deleteHistoryProvider(ref.selected).future);
            await Future.delayed(const Duration(milliseconds: 50));
            customMsg(
                '${ref.selected.month}월 ${ref.selected.day}일 공수가 삭제되었습니다.');
            ref.refreshState(context);
          }
        case AsyncError():
          break;
        case AsyncLoading():
          break;
      }
    }, [data, tapCount]);
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        height: switch (appWidth) {
          > 450 => 26,
          > 420 => 25,
          > 400 => 24,
          _ => Platform.isAndroid ? 21.5 : 22.5,
        },
        width: switch (appWidth) {
          > 450 => 53,
          > 420 => 51.5,
          > 400 => 50,
          _ => 48,
        },
        decoration: BoxDecoration(
          color: isLight ? Colors.grey.shade200 : Colors.black54, // 드래그 중 색상 변경
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(isLight ? 0.2 : 0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: Colors.grey.shade800,
            width: borderWidth.value,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                SvgPicture.asset(
                  context.isDark ? 'assets/trash.svg' : 'assets/Delete.svg',
                  width: switch (appWidth) {
                    > 450 => 12.5,
                    > 420 => 12,
                    > 400 => 11.5,
                    _ => 11,
                  },
                  colorFilter: context.isDark ? ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ) : null,
                ),
                Text(' 삭제',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: context.textColor,
                    fontSize: switch (appWidth) {
                      > 450 => 12,
                      > 420 => 11.5,
                      > 400 => 11,
                      _ => 10.5,
                    },
                    fontWeight:
                        Platform.isAndroid ? FontWeight.w800 : FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
