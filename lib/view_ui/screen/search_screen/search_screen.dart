import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/screen/search_screen/search_duration_component.dart';
import 'package:calendar_project_240727/view_ui/screen/search_screen/search_list_component.dart';
import 'package:calendar_project_240727/view_ui/screen/search_screen/search_result_component.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../model/work_history_model.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../../view_model/sqlite_model/search_list_model.dart';


class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(viewHistoryProvider);
    final searchHistoryAsync = ref.watch(searchHistoryNotifierProvider);

    final searchController = useTextEditingController();
    final searchNode = useFocusNode();
    final selectedPeriod = useState('1개월');
    final searchQuery = useState('');

    final searchHistory = searchHistoryAsync.maybeWhen(
      data: (data) => data,
      orElse: () => <String>[],
    );

    // 🔍 필터링된 검색 결과
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

          // 🔎 텍스트 검색 (memo contain)
          if (searchQuery.value.isNotEmpty) {
            results = results.where((history) {
              return history.memo.contains(searchQuery.value);
            }).toList();
          }
          results = results.where((history) => history.memo.isNotEmpty).toList();
          // 📆 날짜 내림차순 정렬
          results.sort((a, b) => b.date.compareTo(a.date));

          return results;
        }(),
        _ => <WorkHistory>[],
      };
    }, [historyAsync, selectedPeriod.value, searchQuery.value]);

    final periods = ['최근 1개월', '3개월', '6개월', '12개월', '18개월'];


    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              children: [
                SizedBox(height: 5),
                // 🔝 검색 바
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: 20,),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: context.isDark ? Colors.black87 : Colors.grey[200],
                            border: Border.all(
                              color: context.isDark ? Colors.white : Colors.white,
                              width: context.isDark ? 0.75 : 0.35,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextField(
                            focusNode: searchNode,
                            controller: searchController,
                            cursorColor: Colors.grey.shade700,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  searchQuery.value = searchController.text;
                                  if (searchController.text.isNotEmpty) {


                                    ref.read(searchHistoryNotifierProvider.notifier).addKeyword(searchQuery.value);

                                  }
                                },
                                icon: Icon(
                                    Icons.search,
                                    color: context.isDark ? Colors.white : Colors.teal,
                                    size: 20),
                              ),
                              isDense: true,
                              hintText: ' 메모 검색...',
                              hintStyle: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            onSubmitted: (value) {
                              searchQuery.value = value;
                              if (value.isNotEmpty) {
                                ref.read(searchHistoryNotifierProvider.notifier).addKeyword(searchQuery.value);

                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 📊 기간 선택 칩
                PeriodSelectorWidget(
                  selectedPeriod: selectedPeriod,
                  periods: periods,
                ),
                SizedBox(height: 20),
                // 🕐 검색 히스토리
                SearchListWidget(
                  searchHistory: searchHistory,
                  searchController: searchController,
                  searchQuery: searchQuery,
                  searchNode: searchNode,
                  isVisible: !isKeyboardVisible,
                  onDeleteKeyword: (keyword) {
                    ref.read(searchHistoryNotifierProvider.notifier).removeKeyword(keyword);
                  },
                  onClearAll: () {
                    ref.read(searchHistoryNotifierProvider.notifier).clearAll();
                  },
                ),

                // 📋 검색 결과 영역
                Expanded(
                  child: SearchResultWidget(
                    historyAsync: historyAsync,
                    filteredResults: filteredResults,
                    selectedPeriod: selectedPeriod.value,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}