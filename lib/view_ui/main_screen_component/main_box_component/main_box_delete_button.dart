import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../screen/calendar_screen/provider/delete_count_provider.dart';

class DeleteChip extends HookConsumerWidget {
  const DeleteChip({super.key});

  Widget build(BuildContext context,WidgetRef ref) {
    final borderWidth = useState(0.75);

    final data = ref.history;
    final appWidth = context.width;
    final tapCount = ref.watch(deleteTapCountProvider);

    useEffect(() {
      Future.microtask(() =>
          ref.read(deleteTapCountProvider.notifier).loadCount()
      );
      return null;
    }, []);

    final handleTap = useCallback(() async {
      borderWidth.value = 1.25;
      await ref.read(deleteTapCountProvider.notifier).increment();
      switch (data) {
        case AsyncData(:final value):
          final selectedOne = value.where((e) => e.date.toUtc() == ref.selected);
          if (selectedOne.isEmpty) {
            customMsg('${ref.selected.month}월 ${ref.selected.day}일 공수가 없습니다.');
          } else {
            await ref.read(deleteHistoryProvider(ref.selected).future);
            await Future.delayed(const Duration(milliseconds: 50));
            customMsg('${ref.selected.month}월 ${ref.selected.day}일 공수가 삭제되었습니다.');
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
          _ => 22.5,
        },

        width: switch (appWidth) {
          > 450 => 53,
          > 420 =>  51.5,
          > 400 =>  50,
          _ => 48,
        },

        decoration: BoxDecoration(
          color: Colors.grey.shade200, // 드래그 중 색상 변경
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
              color: Colors.grey.shade800,
              width: borderWidth.value,
          ),
        ),
        padding: EdgeInsets.zero,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Platform.isAndroid ? SvgPicture.asset(
                'assets/trash.svg',
                width: switch (appWidth) {
                  > 450 => 13,
                  > 420 => 12,
                  > 400 => 11.5,
                  _ => 11,
                },
                colorFilter: ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
                clipBehavior: Clip.antiAlias,
              ) : SizedBox.shrink(),
              Text(Platform.isAndroid ? ' 삭제' :'🗑️삭제',
                textScaler: TextScaler.noScaling,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Platform.isAndroid
                      ? switch (appWidth) {
                    > 450 => 14.5,
                    > 420 => 12.5,
                    > 400 => 12,
                    _ => 11.5,
                  } : switch (appWidth) {
                    > 450 => 14,
                    > 420 => 12,
                    > 400 => 11.5,
                    _ => 11,
                  },

                  fontWeight: Platform.isAndroid ? FontWeight.w700 :  FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
