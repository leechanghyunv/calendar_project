import 'package:calendar_project_240727/model/selected_history_model.dart';
import 'package:calendar_project_240727/view_model/sqlite_model/selected_model.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/provider/sort_type_provider.dart';
import '../../../../../../core/export_package.dart';
import '../../../../../../theme_color.dart';
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
                  Text('검색버튼을 눌려서 공사기간을 설정해주세요',
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      height: textHeight,
                        fontSize: (width > 400 ? 17 : (width < 370 ? 14.0 : 15.0)),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text('누적금액,공사기간,공수,메모내용을 보여드립니다.',
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      height: textHeight,
                      fontSize: (width > 400 ? 13.5 : (width < 370 ? 11.0 : 12.0)),

                    ),
                  ),
                ],
              ),
            ),
          ),


        ]
    );
  }
}

