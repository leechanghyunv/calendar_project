import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:dartx/dartx.dart';
import 'package:intl/intl.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../view_model/sqlite_model/event_model.dart';
import '../../../../view_model/sqlite_model/history_model.dart';
import 'additional_popup_menu.dart';

class AdditionalCell extends HookConsumerWidget {
  final DateTime day;
  final List<DateTime> weekDays;
  final Map<DateTime, String> holidays;

  const AdditionalCell({
    super.key,
    required this.day,
    required this.weekDays,
    required this.holidays,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(viewHistoryProvider);
    final eventState = ref.watch(eventViewModelProvider);

    final normalizedDay = DateTime(day.year, day.month, day.day);
    final holidayName = holidays[normalizedDay] ?? '';
    final displayText = holidayName.isEmpty
        ? DateFormat('EEEE', 'ko_KR').format(day)
        : holidayName;

    final todayMemo = historyAsync.maybeWhen(
      data: (histories) {
        return histories
            .firstOrNullWhere((h) =>
        h.date.year == day.year &&
            h.date.month == day.month &&
            h.date.day == day.day)
            ?.memo ??
            '';
      },
      orElse: () => '',
    );

    // 메모 없으면 숨김
    if (todayMemo.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                Row(
                children: [
                  TextWidget(
                    '${ref.selected.month}월 ${ref.selected.day}일 $displayText',
                    12,
                    context.width,
                    color: context.subTextColor,
                  ),
                  Spacer(),
                  AdditionalIconButton(),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    width: 3.5,
                    height: 12.5,
                    color: context.sundayColor,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        customMsg('${todayMemo}');
                      },
                      child: TextWidget(
                        todayMemo,
                        12.5,
                        context.width,
                        color: context.textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}