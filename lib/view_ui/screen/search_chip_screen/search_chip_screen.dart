import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/screen/search_chip_screen/provider/calculate_textHeight.dart';
import 'package:calendar_project_240727/view_ui/screen/search_chip_screen/search_chip_use_cases.dart';
import '../../../base_app_size.dart';
import '../../../core/extentions/theme_extension.dart';
import '../../../view_model/selected_memo_filter.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../minor_issue/widget/month_move_button.dart';
import '../../widgets/info_row.dart';
import 'component/floating_row_component.dart';

class SearchChipScreen extends HookConsumerWidget {
  const SearchChipScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

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

    final fontSize = context.width.responsiveSize([14,13.5,13.5,13.5,13,12]);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              InfoRow(
                title: '${ref.monthString}월 메모관리',
                subtitle: '칩을 선택하시면 해당 날짜가 달력상에 표시',
                trailing: MonthMoveButton(),
              ),

              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: selectedLongMemo != null
                    ? calculateTextHeight(
                    selectedLongMemo, context)
                    .clamp(0, 300)
                    : 25,
                curve: Curves.easeInOut,
                child: selectedLongMemo != null
                    ? GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    dismissedMemo.value = selectedLongMemo;
                    ref.read(selectedMemoFilterProvider.notifier).toggle(selectedLongMemo);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 16),
                    decoration: BoxDecoration(
                      color: context.isDark ?  Colors.black54 :  Colors.teal[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: context.isDark ? Colors.tealAccent : Colors.teal,
                          width: 1),
                    ),



                    child: Text(
                      '${selectedLongMemo}',
                      style: TextStyle(
                        color: context.isDark ? Colors.white : Colors.teal[800],
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                )
                    : SizedBox.shrink(),
              ),

              Wrap(
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
                        AnimatedEmoji(
                          AnimatedEmojis.headShake,
                          repeat: false,
                          animate: true,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text('${ref.monthString}월 메모가 없습니다',
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
                      ],
                    ),
                    selected: false,
                    selectedColor: context.isDark ? Colors.black : Colors.grey[100],
                    backgroundColor: context.isDark ? Colors.black : Colors.grey[100],
                    side: BorderSide(
                      color: context.isDark ? Colors.grey.shade200 : Colors.grey[100]!,
                      width: 1.0,
                    ),
                    onSelected: (selected) {
                      dismissedMemo.value = null;
                      HapticFeedback.selectionClick();
                    },
                  ),

                ] : memoCountMap.entries.map((entry) {
                  final memo = entry.key;
                  final count = entry.value;
                  final isSelected = selectedMemos.contains(memo);
                  final displayText = count > 1 ? '$memo ($count)' : memo;
                  return ChoiceChip(
                    label: Text(displayText,
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
                    selected: isSelected,
                    selectedColor: context.isDark ? Colors.black : Colors.grey[100],
                    backgroundColor: context.isDark ? Colors.black : Colors.grey[100],
                    side: BorderSide(
                      color: isSelected
                          ? context.isDark ? Colors.tealAccent : Colors.grey.shade400
                          : context.isDark ? Colors.grey.shade200 : Colors.grey[100]!,
                      width: 1.25,
                    ),
                    onSelected: (selected) {
                      dismissedMemo.value = null;
                      HapticFeedback.selectionClick();
                      ref.read(selectedMemoFilterProvider.notifier).toggle(memo);
                    },
                  );
                }).toList(),
              ),



            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingRowComponent(),

    );
  }
}
