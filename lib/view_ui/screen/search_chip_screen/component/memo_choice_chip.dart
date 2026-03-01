import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_model/selected_memo_filter.dart';

class MemoChoiceChip extends HookConsumerWidget {
  const MemoChoiceChip({
    super.key,
    required this.memoCountMap,
    required this.monthString,
    required this.fontSize,
  });

  final Map<String, int> memoCountMap;
  final String monthString;
  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMemos = ref.watch(selectedMemoFilterProvider);

    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 8,
          runSpacing: 2,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: memoCountMap.isEmpty
              ? [
            ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedEmoji(AnimatedEmojis.headShake, repeat: true, animate: true, size: 20),
                  SizedBox(width: 5),
                  Text(
                    '$monthString월 메모가 없습니다',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: context.isDark ? Colors.white : Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
              selected: false,
              selectedColor: context.isDark ? Colors.black : Colors.grey[100],
              backgroundColor: context.isDark ? Colors.black : Colors.grey[100],
              side: BorderSide(
                color: context.isDark ? Colors.grey.shade200 : Colors.grey[100]!,
                width: 1.0,
              ),
              onSelected: (_) => HapticFeedback.selectionClick(),
            ),
          ]
              : memoCountMap.entries.map((entry) {
            final memo = entry.key;
            final count = entry.value;
            final isSelected = selectedMemos.contains(memo);
            final displayText = count > 1 ? '$memo ($count)' : memo;
            return ChoiceChip(
              label: Text(
                displayText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: context.isDark ? Colors.white : Colors.grey.shade800,
                ),
              ),
              selected: isSelected,
              selectedColor: context.isDark ? Colors.black : Colors.grey[100],
              backgroundColor: context.isDark ? Colors.black : Colors.grey[100],
              side: BorderSide(
                color: isSelected
                    ? context.isDark ? Colors.tealAccent : Colors.grey.shade400
                    : context.isDark ? Colors.grey.shade200 : Colors.grey[100]!,
                width: 1.25,
              ),
              onSelected: (_) {
                HapticFeedback.selectionClick();
                ref.read(selectedMemoFilterProvider.notifier).toggle(memo);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}