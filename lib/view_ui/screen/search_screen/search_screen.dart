import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/view_ui/screen/search_screen/search_result_component.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../core/extentions/theme_color.dart';
import '../../../model/work_history_model.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../../view_model/sqlite_model/search_list_model.dart';
import '../../widgets/info_row.dart';
import '../../widgets/textField_bar/text_field_bar.dart';


class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(viewHistoryProvider);
    final searchHistoryAsync = ref.watch(searchHistoryNotifierProvider);

    final searchController = useTextEditingController();
    final searchNode = useFocusNode();

    final searchQuery = useState('');


    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        searchNode.requestFocus();
      });
      return null;
    }, []);


    // 🔍 필터링된 검색 결과
    final filteredResults = useMemoized(() {
      return switch (historyAsync) {
        AsyncData(:final value) => () {
          var results = value;
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
    }, [historyAsync, searchQuery.value]);

    void searchMethod(){
      searchQuery.value = searchController.text;
      if (searchController.text.isNotEmpty){
        ref.read(searchHistoryNotifierProvider.notifier).addKeyword(searchQuery.value);
      }
    }

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      InfoRow(
                        title: '메모 검색 리스트',
                        subtitle: '등록란에서 업체명 선택후 공수설정',
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: (){
                            HapticFeedback.selectionClick();
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Icon(Icons.keyboard_arrow_down,
                              color: context.isDark ? Colors.white : Colors.grey.shade700,
                              size: 25),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // 🕐 검색 히스토리
                // SearchListWidget(
                //   searchHistory: searchHistory,
                //   searchController: searchController,
                //   searchQuery: searchQuery,
                //   searchNode: searchNode,
                //   isVisible: !isKeyboardVisible,
                //   onDeleteKeyword: (keyword) {
                //     ref.read(searchHistoryNotifierProvider.notifier).removeKeyword(keyword);
                //   },
                //   onClearAll: () {
                //     ref.read(searchHistoryNotifierProvider.notifier).clearAll();
                //   },
                // ),

                // 📋 검색 결과 영역
                Expanded(
                  child: SearchResultWidget(
                    historyAsync: historyAsync,
                    filteredResults: filteredResults,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(10.0),
            child:  Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.25, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFieldBar(
                      focusNode: searchNode,
                      controller: searchController,
                      hintText: ' 메모 검색...',
                      onPressed: () => searchMethod(),
                      onChanged: (value) => searchMethod(),
                      onSubmitted: (value) => searchMethod(),
                      icon: Icons.search,
                    ),

                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}