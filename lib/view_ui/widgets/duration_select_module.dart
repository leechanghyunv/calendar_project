import 'package:flutter/cupertino.dart';
import '../../base_app_size.dart';
import '../../core/export_package.dart';
import '../../core/extentions/theme_color.dart';
import '../../core/widget/text_widget.dart';

class DurationSelectModule extends HookConsumerWidget {
  final FocusNode? focusNode;
  final ValueNotifier<bool> isDuration;
  final ValueNotifier<DateTime> selectedDate;
  final ValueNotifier<DateTime> endDate;

  const DurationSelectModule({
    super.key,
    this.focusNode,
    required this.isDuration,
    required this.selectedDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPicker = useState(false);
    final isSelectingEndDate = useState(false);

    String formatDate(DateTime date) {
      final weekdays = ['월', '화', '수', '목', '금', '토', '일'];
      final weekday = weekdays[date.weekday - 1];
      return '${date.year.toString().substring(2)}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}($weekday)';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.access_time, color: context.subTextColor,),
            SizedBox(width: 15),
            TextWidget(
              isDuration.value ? '기간 선택' : '날짜 선택',
              15,
              context.width,
              color: context.subTextColor,
            ),
            Spacer(),
            Switch(
              value: isDuration.value,
              onChanged: (bool val) {
                isDuration.value = !isDuration.value;
                HapticFeedback.selectionClick();
              },
              activeThumbColor: Colors.teal,
            ),
          ],
        ),

        Row(
          children: [
            GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                focusNode?.unfocus();
                showPicker.value = !showPicker.value;
              },
              child: TextWidget(
                formatDate(selectedDate.value),
                22.5,
                context.width,
              ),
            ),
            if (isDuration.value) ...[
              Spacer(),
              Icon(Icons.arrow_right),
              Spacer(),
              GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  focusNode?.unfocus();
                  isSelectingEndDate.value = true;
                  showPicker.value = !showPicker.value;
                },
                child: TextWidget(
                    formatDate(endDate.value),
                    22.5,
                    context.width
                ),
              ),
            ]
          ],
        ),

        if (showPicker.value && (focusNode?.hasFocus != true))
          Container(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: isSelectingEndDate.value
                  ? endDate.value
                  : selectedDate.value,
              onDateTimeChanged: (dateTime) {
                if (isSelectingEndDate.value) {
                  endDate.value = dateTime;
                } else {
                  selectedDate.value = dateTime;
                }
              },
            ),
          ),


        SizedBox(height: 10),
        Divider(
          color: Theme.of(context).dividerColor,
          thickness: 1,
        ),

      ],
    );
  }
}
