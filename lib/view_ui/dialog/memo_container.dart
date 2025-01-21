import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemoDisplayContainer extends ConsumerWidget {
  const MemoDisplayContainer({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final year = ref.year;
    final month = ref.month;
    final day = ref.day;

    final appWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: Row(
        children: [
          TextWidget('${year}년 ${month}월 ${day}일 기록', 15,appWidth),
        ],
      ),
      content: MemoContainer(ref.selected),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            TextButton(
              onPressed: () {
                customMsg('취소되었습니다.');
                Navigator.pop(context);
              },
              child: TextWidget('취소', 15,appWidth),
            ),
            TextButton(
              onPressed: () async {
                await ref.read(deleteHistoryProvider(ref.selected));
                await Future.delayed(const Duration(milliseconds: 50));
                customMsg('${month}월 ${day}일 공수가 삭제되었습니다.');
                ref.refreshState(context);
              },
              child: TextWidget('삭제', 15,appWidth),
            ),
          ],
        ),

      ],

    );
  }
}


class MemoContainer extends ConsumerWidget {
  final DateTime selected;

  const MemoContainer(this.selected, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.history;
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    return data.when(
        data: (val) {
          final selectedData = val.where((e) => e.date.toUtc() == selected).map((e) => e.memo);

          return SizedBox(
            height: appHeight < 800 ? 105.h : 100.h,
            width: appWidth,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.grey.shade700),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0.w, 0.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          cursorColor: Colors.grey.shade700,
                          style: textStyle(15,appWidth),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '메모 수정,입력 가능합니다.',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          initialValue: selectedData.join(', '),
                          onFieldSubmitted: (val) {
                            ref.read(updateMemoHistoryProvider(selected, val));
                            if (context.mounted){
                              ref.refreshState(context);
                              customMsg('메모가 수정되었습니다.');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(5.0.w, 8.0, 8.0.w, 0.0),
                  child: Row(
                    children: [
                      TextWidget2(
                        selectedData.join(', ').isEmpty
                          ? '${selected.year % 100}년 ${selected.month}월 ${selected.day}일 매모한 내용이 없습니다.'
                          : '${selected.year % 100}년 ${selected.month}월 ${selected.day}일 메모 입니다.',
                        9.5,
                          Colors.black,appWidth
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (err, trace) => const SizedBox(),
        loading: () => const SizedBox()
    );
  }
}



