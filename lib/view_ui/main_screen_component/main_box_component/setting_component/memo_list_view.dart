
import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../../core/export_package.dart';

class MemoListView extends StatelessWidget {
  const MemoListView({super.key});

  @override

  Widget build(BuildContext context) {

    return  Expanded(
      child: Consumer(
          builder: (context, ref, child) {
            final selectedDate = ref.selected;
            final data = ref.history.value;

            final monthlyHistoriesWithMemo = data?.where((history) =>
            history.date.year == selectedDate.year &&
                history.date.month == selectedDate.month &&
                history.memo.isNotEmpty
            ).toList() ?? [];

            return monthlyHistoriesWithMemo.isNotEmpty
                ? ListView.builder(
              itemCount: monthlyHistoriesWithMemo.length,
              itemBuilder: (context, index) {
                final history = monthlyHistoriesWithMemo[index];

                final record = '${(history.pay/10000).toStringAsFixed(1)}만원';

                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: context.height > 750 ? 8.0 : 4.0
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: context.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade800,
                            width: 0.35,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 35,
                                    child: Text(
                                      '${history.date.day}일',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.teal.shade600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0, bottom: 2.0),
                                    child: TextWidget(history.memo, 15, context.width),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Spacer(),
                                  infoChips(record,context),
                                  SizedBox(width: 7.5),
                                  infoChips('${history.record}공수',context),
                                  SizedBox(width: 2.5),
                                ],
                              ),



                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 12.5,
                          right: 10,
                          child: Row(
                            children: [
                              SizedBox(width: 7.5),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: 17,
                                  color: Colors.grey,
                                ),
                                onPressed: () {

                                },
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                splashRadius: 15.0,
                              ),
                            ],
                          )),
                    ],
                  )
                );
              },
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: AnimatedEmoji(
                    AnimatedEmojis.dolphin,
                    repeat: true,
                    animate: true,
                    size: 125,
                  ),
                ),
                SizedBox(height: 20),
                TextWidget('이번 달 메모가 없습니다', 18, context.width),
              ],
            );
          }
      ),
    );


  }

  Widget infoChips (String text, BuildContext context) => Container(
    padding:  EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.grey.shade700,
        width: 0.25,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: TextWidget(text, 11, context.width),
  );

}
