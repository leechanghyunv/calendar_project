import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/export_package.dart';
import '../../view_model/sqlite_model/history_model.dart';

class CalendarRangeHeader extends HookConsumerWidget {
  final DateTime day;
  final DateTime? startDay;
  final DateTime? endDay;
  final VoidCallback? onPreviousYear;
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;

  const CalendarRangeHeader(
      {super.key,
      required this.day,
      this.onPreviousMonth,
      this.onNextMonth,
      this.onPreviousYear, this.startDay, this.endDay});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    String _formatDate(DateTime? date) {
      if (date == null) return '날짜를 선택 해주세요';

      final formatter = DateFormat('yyyy년 MM월 dd일', 'ko_KR');
      return formatter.format(date);
    }

    final appWidth = MediaQuery.of(context).size.width;

    final dateRangeValue = ref.watch(rangeSelectManagerProvider);
    final dateRange = ref.watch(timeRangeManagerProvider);

    final dateRangeState = dateRangeValue.startSelected && dateRangeValue.endSelected;

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    final animation = Tween<double>(begin: 0.1, end: 1.0).animate(controller);

    return Padding(
      padding: EdgeInsets.only(left: 10, bottom: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 35,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1.75, color: Colors.grey.shade500),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Text(
                     '${_formatDate(startDay)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                flex: 1,
                child: Container(
                  height: 35,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.75, color: Colors.grey.shade500),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Text(
                    '${_formatDate(endDay)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  width: 5,
                  height: 20,
                  color: dateRangeState
                      ? context.isDark ? Colors.tealAccent : Colors.teal
                      : context.isDark ? Colors.tealAccent : Colors.teal,
                ),
                SizedBox(width: 10),
                dateRangeState ? Row(
                  children: [
                    TextWidget(
                        '${DateFormat.yMMMM('ko_KR').format(day)}',
                        20, appWidth,color: context.textColor),
                    SizedBox(width: 15),

                    FadeTransition(
                      opacity: animation,
                      child: GestureDetector(
                          onTap: (){

                            showDialog(context: context, builder: (context) =>
                                AlertDialog(
                                  backgroundColor:  context.dialogColor,
                                  shape: context.dialogShape,
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: TextWidget('공수기록을 모두 삭제하시겠습니까?',
                                        15,appWidth,color: context.textColor),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: TextWidget('취소', 15,
                                          appWidth,color: context.textColor),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        deleteMonthHistoryProvider(dateRange.startDate,dateRange.endDate);
                                        ref.refreshState(context);
                                        Navigator.of(context, rootNavigator: true).pop();
                                        customMsg('선택하신 기간이 삭제되었습니다.');
                                      },
                                      child: TextWidget('삭제', 15,appWidth,
                                          color: context.textColor),
                                    ),
                                  ],
                                ),
                            );

                          },
                          child: Icon(MdiIcons.trashCanOutline)),
                    )
                  ],
                )
                    : TextWidget(
                    '${DateFormat.yMMMM('ko_KR').format(day)}',
                    20, appWidth,color: context.textColor),


                Spacer(),
                InkWell(
                  onTap: onPreviousMonth,
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(Icons.keyboard_arrow_left,
                      color: context.isDark ? Colors.white : Colors.grey.shade700,
                      size: 30),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: onNextMonth,
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(Icons.keyboard_arrow_right,
                      color: context.isDark ? Colors.white : Colors.grey.shade700,
                      size: 30),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
