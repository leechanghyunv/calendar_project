import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/base_app_size.dart';

import '../../../base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/extentions/theme_extension.dart';
import '../../../view_model/selected_memo_filter.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../screen/search_chip_screen/search_chip_use_cases.dart';
import '../main_box_component/main_box_sizes.dart';

class SearchChipBox extends HookConsumerWidget {
  const SearchChipBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;

    final historyAsync = ref.watch(viewHistoryProvider);

    final selectedMemos = ref.watch(selectedMemoFilterProvider);

    final dismissedMemo = useState<String?>(null);

    final filteredResults = useFilteredResults(
      historyAsync: historyAsync,
      selectedDate: ref.selected,
    );

    final memoCountMap = useMemoCountMap(filteredResults);

    final selectedLongMemo = useSelectedLongMemo(
      selectedMemos: selectedMemos,
      dismissedMemo: dismissedMemo.value,
    );

    final fontSize = context.width.responsiveSize([11,10,10,9.5,9.5,9]);


    final boxSizes = MainBoxSizes(
      width: context.width,
      isFold: isFoldValue,
    );

    return Container(
      height: boxSizes.chartBoxHeight,
      decoration: BoxDecoration(
        color: context.boxColor,
        borderRadius: BorderRadius.circular(8),
        border: context.isLight ? null : Border.all(width: 0.25,color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Wrap(
              spacing: 2,
              runSpacing: 0,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: memoCountMap.isEmpty
                  ? [

                Container(
                  decoration: BoxDecoration(
                    color: context.isDark ? Colors.black : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: context.isLight ? null : Border.all(
                      width:  0.25,
                      color: context.isDark ? Colors.grey.shade200 : Colors.grey[100]!,
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedEmoji(
                          AnimatedEmojis.headShake,
                          repeat: false,
                          animate: true,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text('${ref.monthString}월 메모가 없습니다',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              color: context.isDark
                                  ? Colors.white
                                  : Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // selected: false,
                  // selectedColor: context.isDark ? Colors.black : Colors.grey[100],
                  // backgroundColor: context.isDark ? Colors.black : Colors.grey[100],
                  // side: BorderSide(
                  //   color: context.isDark ? Colors.grey.shade200 : Colors.grey[100]!,
                  //   width: 1.0,
                  // ),
                  // onSelected: (selected) {
                  //   dismissedMemo.value = null;
                  //   HapticFeedback.selectionClick();
                  // },
                ),

              ] : memoCountMap.entries.map((entry) {
                final memo = entry.key;
                final count = entry.value;
                final isSelected = selectedMemos.contains(memo);
                final displayText = count > 1 ? '$memo ($count)' : memo;
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 4.0),
                  child: GestureDetector(
                    onTap: (){
                      dismissedMemo.value = null;
                      HapticFeedback.selectionClick();
                      ref.read(selectedMemoFilterProvider.notifier).toggle(memo);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.isDark ? Colors.black : Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                        border: context.isLight ? null : Border.all(
                            width: isSelected ? 0.75 : 0.25,
                            color: isSelected
                                ? context.isDark ? Colors.tealAccent : Colors.grey.shade400
                                : context.isDark ? Colors.grey.shade200 : Colors.grey[100]!,
                        ),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(displayText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: context.isDark
                                ? Colors.white
                                : Colors.grey.shade800,
                          ),
                        ),
                      ),
                      // selected: isSelected,
                      // selectedColor: context.isDark ? Colors.black : Colors.grey[100],
                      // backgroundColor: context.isDark ? Colors.black : Colors.grey[100],
                      // side: BorderSide(
                      //   color: isSelected
                      //       ? context.isDark ? Colors.tealAccent : Colors.grey.shade400
                      //       : context.isDark ? Colors.grey.shade200 : Colors.grey[100]!,
                      //   width: 1.25,
                      // ),
                      // onSelected: (selected) {
                      //   dismissedMemo.value = null;
                      //   HapticFeedback.selectionClick();
                      //   ref.read(selectedMemoFilterProvider.notifier).toggle(memo);
                      // },
                    ),
                  ),
                );
              }).toList(),
            ),

          ],
        ),
      ),
    );
  }
}
