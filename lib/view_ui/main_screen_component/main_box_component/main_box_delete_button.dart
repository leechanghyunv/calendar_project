import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../screen/calendar_screen/provider/delete_count_provider.dart';
import '../../widgets/svg_imoji.dart';

class DeleteChip extends HookConsumerWidget {
  const DeleteChip({super.key});

  double _getSize(double appWidth, {required List<double> sizes}) {
    if (appWidth > 450) return sizes[0];
    if (appWidth > 420) return sizes[1];
    if (appWidth > 400) return sizes[2];
    return sizes[3];
  }

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
            customMsg('${ref.selected.day}일 공수가 없습니다.');
          } else {
            await ref.read(deleteHistoryProvider(ref.selected).future);
            await Future.delayed(const Duration(milliseconds: 50));
            customMsg(
                '${ref.selected.day}일 공수가 삭제되었습니다.');
            ref.refreshState(context);
          }
        case AsyncError():
          break;
        case AsyncLoading():
          break;
      }
    }, [data, tapCount]);

    final height = _getSize(appWidth, sizes: [26, 25, 25, Platform.isAndroid ? 21.5 : 22.5]);
    final iconSize = _getSize(appWidth, sizes: [14, 12.5, 12.5, 11]);
    final fontSize = _getSize(appWidth, sizes: [14, 12.5, 12, 10.5]);

    return GestureDetector(
      onTap: handleTap,
      child: Container(
        height: height,
        // width: width,
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
          padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 1.0),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgImoJi(
                  nameLight: 'Delete',
                  nameDark: 'trash',
                  width: iconSize,
                ),

                Text(' 삭제',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: context.textColor,
                    fontSize: fontSize,
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
