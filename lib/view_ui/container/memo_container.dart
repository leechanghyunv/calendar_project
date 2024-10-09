import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../repository/calendar_time_controll.dart';


class MemoDisplayContainer extends ConsumerWidget {
  const MemoDisplayContainer({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final selected = ref.watch(timeManagerProvider);
    final appWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: Row(
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
      content: MemoContainer(selected.selected),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: TextWidget('취소', 15,appWidth),
        ),
        TextButton(
          onPressed: () async {
            ref
                .read(deleteHistoryProvider(selected.selected));
            Future.delayed(const Duration(seconds: 0), () {});
            ref
                .read(timeManagerProvider.notifier)
                .selectedNextDay();
            Navigator.pushReplacementNamed(context, '/main');
          },
          child: TextWidget('삭제', 15,appWidth),
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
          final selectedData = val.where((e) => e.date.toUtc() == selected).map((e) => e.memo);
          return SizedBox(
            height: 85.sp,
            child: Column(
              children: [
                Container(
                  height: 60.sp,
                  color: Colors.grey[200],
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 8.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        TextWidget(selectedData.join(', '), 15,appWidth),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 8.0, 8.0, 0.0),
                  child: Row(
                    children: [
                      TextWidget2(
                        selectedData.join(', ').isEmpty
                          ? '${selected.year % 100}년 ${selected.month}월 ${selected.day}일 기록한 내용이 없습니다.'
                          : '${selected.year % 100}년 ${selected.month}월 ${selected.day}일 메모 데이터입니다.',
                        8.5,
                        Colors.blue.shade700,appWidth
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (err, trace) => const SizedBox(),
        loading: () => const SizedBox());
  }
}
