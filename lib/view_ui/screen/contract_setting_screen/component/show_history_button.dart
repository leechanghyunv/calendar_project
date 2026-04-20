import 'dart:ui';

import 'package:intl/intl.dart';

import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../model/work_history_model.dart';
import '../provider/latest_history_provider.dart';

class ShowHistoryButton extends HookConsumerWidget {
  final TextEditingController textController;
  final TextEditingController decimalController;

  const ShowHistoryButton({
    super.key,
    required this.textController,
    required this.decimalController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = useState(false);
    final overlayEntry = useRef<OverlayEntry?>(null);
    final latestHistory = ref.watch(latestHistoryListProvider).valueOrNull ?? [];

    void removeOverlay() {
      overlayEntry.value?.remove();
      overlayEntry.value = null;
      isOpen.value = false;
    }

    void showOverlay(List<WorkHistory> histories) {
      isOpen.value = true;
      overlayEntry.value = OverlayEntry(
        builder: (_) => Stack(
          children: [
            // ✅ 블러 배경
            Positioned.fill(
              child: GestureDetector(
                onTap: removeOverlay,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Container(color: Colors.black.withOpacity(0.25)),
                ),
              ),
            ),

            // ✅ 멀티 액션 버튼들 (우하단 기준)
            Positioned(
              bottom: 150,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: context.isDark ? Colors.black87 : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      3, 10, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: histories.map((history) => _ActionItem(
                      history: history,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        // TODO: textController, decimalController에 값 반영
                        removeOverlay();
                      },
                    )).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      Overlay.of(context).insert(overlayEntry.value!);
    }

    // 위젯 dispose시 오버레이 제거
    useEffect(() => removeOverlay, const []);

    return GestureDetector(
      onTap: isOpen.value ? removeOverlay : () => showOverlay(latestHistory),
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: Row(
          children: [
            TextWidget(
              ' @ 최근기록 ',
              13,
              context.width,
              color: context.subTextColor,
            ),
          ],
        ),
      ),
    );
  }
}

// 액션 아이템 위젯
class _ActionItem extends StatelessWidget {
  final WorkHistory history;
  final VoidCallback onTap;

  const _ActionItem({
    required this.history,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final dateLabel = DateFormat('M월 d일').format(history.date);


    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: context.isDark ? Colors.black87 : Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),

                    child: Padding(
                      /// (this.left, this.top, this.right, this.bottom)
                      padding: const EdgeInsets.fromLTRB(
                          5, 7.5, 10, 7.5),
                      child: TextWidget('${dateLabel}', 13, context.width),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}