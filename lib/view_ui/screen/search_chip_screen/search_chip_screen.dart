import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/view_ui/screen/search_chip_screen/provider/calculate_textHeight.dart';
import 'package:calendar_project_240727/view_ui/screen/search_chip_screen/search_chip_use_cases.dart';
import '../../../view_model/selected_memo_filter.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../widgets/info_row.dart';
import 'component/floating_row_component.dart';
import 'component/search_duration_dropDown.dart';

class SearchChipScreen extends HookConsumerWidget {
  const SearchChipScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final historyAsync = ref.watch(viewHistoryProvider);

    final selectedPeriod = useState('1개월');

    final selectedMemos = ref.watch(selectedMemoFilterProvider);

    final dismissedMemo = useState<String?>(null);

    final filteredResults = useFilteredResults(
      historyAsync: historyAsync,
      selectedPeriod: selectedPeriod.value,
    );

    final memoCountMap = useMemoCountMap(filteredResults);

    final selectedLongMemo = useSelectedLongMemo(
      selectedMemos: selectedMemos,
      dismissedMemo: dismissedMemo.value,
    );


    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              InfoRow(
                title: selectedPeriod.value == '1개월'
                    ? '${ref.month}월 메모관리'
                    : '${selectedPeriod.value} 메모관리',
                subtitle: '칩을 선택하시면 해당 날짜에 해당되는 ',
                trailing: Row(
                  children: [
                    SearchDurationDropdown(
                      controller: selectedPeriod,
                    ),
                  ],
                ),
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
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.teal, width: 1),
                    ),
                    child: Text(
                      '${selectedLongMemo}',
                      style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                )
                    : SizedBox.shrink(),
              ),

              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 2,
                  children: memoCountMap.entries.map((entry) {
                    final memo = entry.key;
                    final count = entry.value;
                    final isSelected = selectedMemos.contains(memo);
                    final displayText = count > 1 ? '$memo ($count)' : memo;

                    return ChoiceChip(
                      label: Text(displayText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13.0,fontWeight: FontWeight.bold,color: Colors.grey.shade800),
                      ),
                      selected: isSelected,
                      selectedColor: Colors.grey[200],
                      backgroundColor: Colors.grey[200],
                      side: BorderSide(
                        color: isSelected ? Colors.grey.shade800 : Colors.grey[200]!,
                        width: 1.0,
                      ),

                      onSelected: (selected) {
                        dismissedMemo.value = null;
                        HapticFeedback.selectionClick();
                        ref.read(selectedMemoFilterProvider.notifier).toggle(memo);
                      },
                    );
                  }).toList(),
                ),
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
