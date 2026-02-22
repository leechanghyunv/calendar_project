import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

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
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: .start,
                children: [
                  TextWidget('업체정산률', 12.5, context.width),
                  Spacer(),
                  /// 38°C
                  TextWidget('22.2%', 11, context.width,color: context.subTextColor),
                ],
              ),
              SizedBox(height: 5),
              Divider(thickness: 2.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: AnimatedEmoji(
                        AnimatedEmojis.cursing,
                        repeat: true,
                        animate: true,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text('욕나온다 진짜 욕나온다 진짜 욕나온다 진짜 욕나온다 진짜',style: TextStyle(fontSize: 10),),
                    )
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text('어지러움증을 느끼신다면 반드시 작업을 멈추세요 반장님 ^^',style: TextStyle(fontSize: 10),),

            ],
          ),
        ),
      ),
    );
  }
}
