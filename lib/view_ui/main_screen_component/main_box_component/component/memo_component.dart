
import 'package:calendar_project_240727/base_app_size.dart';
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

    final appWidth = context.width;
    final appHeight = context.height;
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


    return Column(
      children: [
        SizedBox(height: 5),
        Row(
          children: [
            TextWidget('${ref.monthString}월 메모기록(${monthlyMemoCount})', 14, appWidth),
            SizedBox(width: 7.5),
            Icon(Icons.keyboard_arrow_down_rounded),
            Spacer(),
            GestureDetector(
                onTap: (){
                  ref.read(showMemoStateProvider.notifier).memoState();
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
        Container(
          /// appHeight > 750 ? appHeight > 850 ? 150 : 120 : 100
          height: appHeight > 750 ? 165 : 155,

          alignment: Alignment.center,
          child: Column(
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
          ),

        ),
      ],
    );
  }
}


