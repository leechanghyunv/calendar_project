import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';

import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';

class AdditionalCell extends HookConsumerWidget {
  final DateTime day;
  final List<DateTime> weekDays;
  final Map<DateTime, String> holidays;

  const AdditionalCell(
      {super.key,
      required this.day,
      required this.weekDays,
      required this.holidays});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  TextWidget('${ref.selected.month}월 ${ref.selected.day}일 월요일',
                      13, context.width,
                      color: context.subTextColor),
                  SizedBox(width: 10),
                  Spacer(),
                  Icon(Icons.add, size: 15, color: context.subTextColor),
                ],
              ),
              Spacer(),
              TextWidget(
                  '🎉 쇼미더머니 세팅 (다토) 07:00 출근 17:00 퇴근', 13, context.width,
                  color: context.textColor),
            ],
          ),
        ),
      ),
    );
  }
}
