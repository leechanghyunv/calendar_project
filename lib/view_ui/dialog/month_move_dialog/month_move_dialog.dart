import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';

class MonthMoveDialog extends HookConsumerWidget {
  const MonthMoveDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedYear = useState(DateTime.now().year);
    final selectedMonth = useState<int?>(null);

    final years = List.generate(DateTime.now().year - 2000 + 1, (index) => DateTime.now().year - index);

    final isSmall = context.width <= 375;

    final rowCount = isSmall ? 4 : 3;
    final colCount = isSmall ? 3 : 4;
    return AlertDialog(
      backgroundColor: Colors.grey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Row(
        children: [
          PopupMenuButton<int>(
            itemBuilder: (context) => years
                .map((year) => PopupMenuItem(
              value: year,
              child: TextWidget('$year년', 15, context.width),
            ))
                .toList(),
            child: Row(
              children: [
                TextWidget('${selectedYear.value}년', 18, context.width),
                const SizedBox(width: 2.5),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.keyboard_arrow_down_rounded, size: 25.5, color: Colors.grey.shade900),
                ),
              ],
            ),
            onSelected: (year) {
              selectedYear.value = year;
            },
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5),
              color: Colors.grey.shade100,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var row = 0; row < rowCount; row++) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(colCount, (i) {
                        final month = row * colCount + i + 1;
                        final isSelected = selectedMonth.value == month;
                        return GestureDetector(
                          onTap: () {
                            selectedMonth.value = month;
                            customMsg('${selectedYear.value}년 ${selectedMonth.value}월 선택');
                            ref.timeNot.moveToMonth(selectedYear.value, selectedMonth.value!);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.grey.shade300 : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                            child: TextWidget('${month.toString().padLeft(2, '0')}월', 15, context.width),
                          ),
                        );
                      }),
                    ),
                    if (row < rowCount - 1) const SizedBox(height: 30),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: TextWidget('나가기', 15, context.width),
        ),
        TextButton(
          onPressed: selectedMonth.value != null
              ? () {
            customMsg('${selectedYear.value}년 ${selectedMonth.value}월');
            ref.timeNot.moveToMonth(selectedYear.value, selectedMonth.value!);
            Navigator.of(context).pop();
          }
              : null,
          child: TextWidget('확인', 15, context.width),
        ),
      ],
    );
  }
}