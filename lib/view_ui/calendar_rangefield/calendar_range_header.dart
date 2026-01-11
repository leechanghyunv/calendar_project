import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';
import 'package:intl/intl.dart';
import '../../core/export_package.dart';
import '../../core/utils/converter.dart';
import '../screen/range_history_screen/component/month_popup_button.dart';
import '../screen/range_history_screen/component/range_date_box.dart';


class CalendarRangeHeader extends HookConsumerWidget {
  final DateTime day;
  final DateTime? startDay;
  final DateTime? endDay;
  final ValueChanged<int>? onMonthsSelected;
  final VoidCallback? onPreviousYear;
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;
  final VoidCallback? remove;

  const CalendarRangeHeader(
      {super.key,
        required this.day,
        this.onPreviousMonth,
        this.onNextMonth,
        this.remove,
        this.onPreviousYear, this.startDay, this.endDay,this.onMonthsSelected,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;

    final dateRangeValue = ref.watch(rangeSelectManagerProvider);
    ref.watch(timeRangeManagerProvider);

    final dateRangeState = dateRangeValue.startSelected && dateRangeValue.endSelected;

    return Padding(
      padding: EdgeInsets.only(left: 10, bottom: 20.0),
      child: Column(
        children: [

          RangeDateRow(
              startDate: '${formatSelectedDate(startDay)}',
              endDate: '${formatSelectedDate(endDay)}'),

          SizedBox(height: context.width > 400 ? 25 : 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 5,
                  height: 25,
                  color: dateRangeState
                      ? context.isDark ? Colors.tealAccent : Colors.teal
                      : context.isDark ? Colors.tealAccent : Colors.teal,
                ),
                SizedBox(width: 7.5),
                TextWidget(
                  // '322.5만원 [32공수]',
                    '${DateFormat.yMMMM('ko_KR').format(day)}',
                    20, appWidth,color: context.textColor),
                Spacer(),
                MonthPopupButton(
                  onSelected: onMonthsSelected, // 👈 콜백 연결
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
