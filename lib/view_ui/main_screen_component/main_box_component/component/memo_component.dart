
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/show_memo_provider.dart';

import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';

class MemoComponent extends HookConsumerWidget {

  final FocusNode nodeMemo;
  final TextEditingController memoController;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;


  const MemoComponent(
      this.nodeMemo,
      this.memoController,
      this.onChanged,
      this.onFieldSubmitted,

       {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;
    final  memoState = ref.watch(showMemoStateProvider);

    final selectedDate = ref.selected;
    final historyAsync = ref.history;

    final data = ref.history.valueOrNull;
    final monthlyMemoCount = data?.where((history) =>
    history.date.year == selectedDate.year &&
        history.date.month == selectedDate.month &&
        history.memo.isNotEmpty
    ).length ?? 0;

    String hintValue() {
      final data = ref.history.value;
      final selectedDate = DateTime.utc(DateTime.now().year, ref.month, ref.day
      );

      try{
        final existingMemo = data
            ?.where((e) =>
        e.date.year == selectedDate.year &&
            e.date.month == selectedDate.month &&
            e.date.day == selectedDate.day)
            .firstOrNull
            ?.memo;

        return existingMemo?.isNotEmpty ?? false
            ? ' ${existingMemo}'
            : ' 메모입력';
      }catch(e){
        return ' 메모입력';
      }
    }


    Decoration infoBoxDeco = BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey.shade900,
        width: 0.55,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
    );

    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            TextWidget('${ref.monthString}월 메모기록(${monthlyMemoCount})', 14, appWidth),
            SizedBox(width: 7.5),
            Icon(Icons.keyboard_arrow_down_rounded),
            Spacer(),
            GestureDetector(
                onTap: (){
                  ref.read(showMemoStateProvider.notifier).memoState(true);
                  Future.microtask(() => nodeMemo.requestFocus());
                },
                /// 메모추가를 누르면 memofocus가 집중되도록
                child: TextWidget('+ 메모추가', 14, appWidth)),
          ],
        ),
        Divider(
          color: Colors.grey.shade300,
          thickness: 0.8,
        ),
        SizedBox(height: 5),

        Container(
          height: 200,
          decoration: infoBoxDeco,
          alignment: Alignment.center,
          child: memoState ?  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// memoFocus
              TextFormField(
                focusNode: nodeMemo,
                controller: memoController,
                onChanged: onChanged,
                onFieldSubmitted: onFieldSubmitted,
                maxLines: null, // 자동으로 여러 줄 입력 가능
                cursorColor: Colors.grey.shade500,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 6.0,
                    ),
                  hintText: hintValue(),
                  hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      overflow: TextOverflow.ellipsis),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),

            ],
          ) : Consumer(
              builder: (context, ref, child) {
                final selectedDate = ref.selected;
                final data = ref.history.value;

                final monthlyHistoriesWithMemo = data?.where((history) =>
                history.date.year == selectedDate.year &&
                    history.date.month == selectedDate.month &&
                    history.memo.isNotEmpty
                ).toList() ?? [];

                return monthlyHistoriesWithMemo.isNotEmpty
                    ? ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemCount: monthlyHistoriesWithMemo.length,
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Colors.grey.shade300,
                      height: 1,
                      thickness: 0.5,
                      indent: 45,  // 날짜 너비만큼 들여쓰기
                    ),
                  ),
                  itemBuilder: (context, index) {
                    final history = monthlyHistoriesWithMemo[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 35,
                            child: Text(
                              '${history.date.day}일',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Colors.blue.shade600,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // 메모 내용
                          Expanded(
                            child: Text(
                              history.memo,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Icon(
                              Icons.remove,
                              size: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '이번 달 메모가 없습니다',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '+ 메모추가로 시작하세요',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }
          )

        ),
      ],
    );
  }
}


