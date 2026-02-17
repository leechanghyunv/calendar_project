import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../model/work_history_model.dart';
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

    final filteredResults = useMemoized(() {
      return switch (historyAsync) {
        AsyncData(:final value) => () {
          var results = value;
          // 📅 기간 필터링 (UTC 시간 포함)
          final now = DateTime.now().toUtc();
          final periodMonths = switch (selectedPeriod.value) {
            '1개월' || '최근 1개월' => 1,
            '3개월' => 3,
            '6개월' => 6,
            '12개월' => 12,
            '18개월' => 18,
            _ => 1,
          };

          final startDate = DateTime.utc(
            now.year,
            now.month - periodMonths,
            now.day,
          );

          results = results.where((history) {
            return history.date.toUtc().isAfter(startDate);
          }).toList();

          results = results.where((history) => history.memo.isNotEmpty).toList();
          // 📆 날짜 내림차순 정렬
          results.sort((a, b) => b.date.compareTo(a.date));

          return results;
        }(),
        _ => <WorkHistory>[],
      };
    }, [historyAsync, selectedPeriod.value]);

    // 메모별 카운트 Map
    final memoCountMap = useMemoized(() {
      final countMap = <String, int>{};
      for (var history in filteredResults) {
        countMap[history.memo] = (countMap[history.memo] ?? 0) + 1;
      }
      return countMap;
    }, [filteredResults]);

    // 선택된 메모 중 긴 텍스트 찾기
    final selectedLongMemo = useMemoized(() {
      for (var memo in selectedMemos) {
        if (memo.length > 25) return memo;
      }
      return null;
    }, [selectedMemos]);

// 텍스트 높이 계산 함수
    double _calculateTextHeight(String text, BuildContext context) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(fontSize: 14),
        ),
        maxLines: null,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: MediaQuery.of(context).size.width - 64); // margin + padding

      return textPainter.height + 32 + 32; // padding + margin
    }

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
                title: '02월 메모관리',
                subtitle: '칩을 선택하시면 해당 날짜에 해당되는 ',
                trailing: Row(
                  children: [


                    SearchDurationDropdown(),
                  ],
                ),
              ),

              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: selectedLongMemo != null
                    ? _calculateTextHeight(
                    selectedLongMemo, context)
                    .clamp(0, 300)
                    : 25,
                curve: Curves.easeInOut,
                child: selectedLongMemo != null
                    ? Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                      vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: Text(
                    '${selectedLongMemo}',
                    style: TextStyle(
                      color: Colors.blue[900],
                      // fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                    ),
                  ),
                )
                    : SizedBox.shrink(),
              ),

              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 2,
                  // crossAxisAlignment: WrapCrossAlignment.start,
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
                        width: isSelected ? 1.5 : 1,
                      ),

                      onSelected: (selected) {
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
      floatingActionButton: FloatingRowComponent(),

    );
  }
}
