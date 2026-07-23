import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../core/export_package.dart';
import 'package:calendar_project_240727/view_model/view_provider/calendar_switcher_model.dart';

class TodayCell extends ConsumerWidget {
  final DateTime day;

  const TodayCell(this.day, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final switcher = ref.watch(calendarSwitcherProvider);

    final height = context.height;
    final width = context.width;

    final bool isExpanded = switcher.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );

    final circleContainer = Container(
      width: height < 700 ? 35 : width > 370 ? 40 : 35,
      height: isExpanded ? 50 : 100,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: context.isDark ? null : Colors.grey.shade500,
        border: ref.selected == day
            ? context.isDark
            ? Border.all(width: 1, color: Colors.white)
            : null
            : null,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: TextWidget('${day.day}', 20, color: Color(0xFFFAFAFA),
      ),
    );

    return switch (switcher) {
      AsyncData(value: final useColumn) =>
      useColumn ? Column(children: [circleContainer]) : circleContainer,
      _ => circleContainer,
    };
  }
}
