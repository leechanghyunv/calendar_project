import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/model/statistics/selected_history_model.dart';
import 'package:calendar_project_240727/view_model/sqlite_model/selected_model.dart';
import '../../../../../../core/export_package.dart';
import '../../../../../../view_model/sort_type_provider.dart';
import 'history_box.dart';

class SelectedListview extends ConsumerWidget {
  const SelectedListview({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedValue = ref.watch(viewSelectedHistoryProvider);
    return selectedValue.when(
      loading: () => IntroSelectedBox(),
      error: (err, stack) {
        print('selectedValue error: $err');
        return IntroSelectedBox();
      },
      data: (value){

        final  sortType = ref.watch(sortTypeNotifierProvider);

        final sortedMoney = [...value]..sort((a, b) => b.money.compareTo(a.money));
        final sortedRecord = [...value]..sort((a, b) => b.record.compareTo(a.record));
        final sortedDuration = [...value]..sort((a, b) => b.duration.compareTo(a.duration));

        final List<SelectedHistory> sortedList;

        switch (sortType) {
          case SortBy.money:
            sortedList = sortedMoney;
            break;
          case SortBy.record:
            sortedList = sortedRecord;
            break;
          case SortBy.duration:
            sortedList = sortedDuration;
            break;
          case SortBy.time:
          default:
            sortedList = value; // 정렬 없이 원본 그대로 사용
            break;
        }

        if (value.isEmpty) {
          return IntroSelectedBox();
        }
        return Align(
          alignment: Alignment.topCenter, // 🎯 위쪽 정렬
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: sortedList.length,
              itemBuilder: (context, index){
                final item = sortedList[index];
                return HistoryBox(
                  index: index,
                  selectedHistory: item,
                );
              }
          ),
        );
      },
    );
  }
}


class IntroSelectedBox extends StatelessWidget {
  const IntroSelectedBox({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: width < 370 ? 12.0 : 24.0
            ),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 35.0),
                  TextWidget('공수등록 상단에서 근로기간 설정하기', 15),
                  SizedBox(height: 5.0),
                  TextWidget('근로기간 설정 후 저장 후 보관', 15),

                ],
              ),
            ),
          ),


        ]
    );
  }
}

