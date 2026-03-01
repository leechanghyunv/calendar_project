import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/view_ui/screen/search_chip_screen/search_chip_use_cases.dart';
import '../../../base_app_size.dart';
import '../../../core/extentions/theme_extension.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../minor_issue/widget/month_move_button.dart';
import '../../widgets/info_row.dart';
import 'component/floating_row_component.dart';
import 'component/full_text_box_animated.dart';
import 'component/memo_choice_chip.dart';
import 'component/unpaid_record_box.dart';

class SearchChipScreen extends HookConsumerWidget {
  const SearchChipScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final historyAsync = ref.watch(viewHistoryProvider);
    final filteredResults = useFilteredResults(
      historyAsync: historyAsync,
      selectedDate: ref.selected,
    );

    final memoCountMap = useMemoCountMap(filteredResults);

    final fontSize = context.width.responsiveSize([14,13.5,13.5,13.5,13,12]);

    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
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

              FullTextBoxAnimated(fontSize: fontSize),


              UnpaidRecordBox(),
              // MemoChoiceChip(
              //   memoCountMap: memoCountMap,
              //   monthString: ref.monthString,
              //   fontSize: fontSize,
              // ),

            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingRowComponent(),

      ),
    );
  }
}
