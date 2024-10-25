import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/widget/text_style_util.dart';
import '../../repository/calendar_time_controll.dart';


class MemoDisplayContainer extends ConsumerWidget {
  const MemoDisplayContainer({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final selected = ref.watch(timeManagerProvider);
    final month = selected.selected.month;
    final day = selected.selected.day;
    final appWidth = MediaQuery.of(context).size.width;

    final textSize2 = appWidth > 500? screenUtilSize(6.5) : screenUtilSize(13);

    return AlertDialog(
      title: Column(
        children: [
          Row(
            children: [
              TextWidget('${selected.selected.year}년 ${selected.selected.month}월 ${selected.selected.day}일 기록', 15,appWidth),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  12.0),
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.black, size: 20),
              ),
            ],
          ),
          ErrorText('${selected.selected.month}월 ${selected.selected.day}일 기록(메모)열람, 삭제란 입니다.', appWidth)
        ],
      ),
      content: MemoContainer(selected.selected),
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
                await ref.read(deleteHistoryProvider(selected.selected));
                customMsg('${month}월 ${day}일 공수기록을 삭제합니다');
                Navigator.pushReplacementNamed(context, '/main');
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

    final data = ref.watch(viewHistoryProvider);
    final appWidth = MediaQuery.of(context).size.width;

    return data.when(
        data: (val) {
          final selectedItems = val.where((e) => e.date.toUtc() == selected).toList();

          final selectedData = val.where((e) => e.date.toUtc() == selected).map((e) => e.memo);
          final code = val.where((e) => e.date.toUtc() == selected).map((e) => e.colorCode);

          Color mainColor = selectedItems.isNotEmpty && code.isNotEmpty && code.first != null
              ? HexColor.fromHex(code.first)
              : Colors.grey; // 기본 색상


          return SizedBox(
            height: 85.sp,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                        child: Container(
                          height: 50.sp,
                          color: mainColor,
                        ),
                    ),

                    Flexible(
                      flex: 20,
                      child: Container(
                        height: 50.sp,
                        color: Colors.grey[100],
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 8.0, 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              TextWidget(' ${selectedData.join(', ')}', 15,appWidth),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 8.0, 8.0, 0.0),
                  child: Row(
                    children: [
                      TextWidget2(
                        selectedData.join(', ').isEmpty
                          ? '${selected.year % 100}년 ${selected.month}월 ${selected.day}일 매모한 내용이 없습니다.'
                          : '${selected.year % 100}년 ${selected.month}월 ${selected.day}일 메모 데이터입니다.',
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

extension HexColor on Color {
  static Color fromHex(String hexString) {
    Color color;
    try {
      String colorString = hexString;
      colorString = colorString.toUpperCase().replaceAll("#", "");
      if (colorString.length == 6) {
        colorString = "FF$colorString";
      }
      color = Color(int.parse(colorString, radix: 16));
    } on Exception {
      color = Colors.white;
    }
    return color;
  }
}

