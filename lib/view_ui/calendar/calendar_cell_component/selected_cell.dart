
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../view_model/view_provider/calendar_switcher_model.dart';


class SelectedCell extends ConsumerWidget {
  final DateTime day;

  const SelectedCell(this.day, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switcher = ref.watch(calendarSwitcherProvider);
    final appHeight = context.height;
    final bool isExpanded = switcher.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );
    final circleContainer = Container(
      width: appHeight < 700 ? 35 : 40,
      height: isExpanded ? 50 : 100,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color:  context.isDark ? null : Colors.grey.shade600,
        border: context.isDark ? Border.all(width: 1, color: Colors.tealAccent) : null,
        // border: Border.all(width: 1, color: context.isDark ? Colors.tealAccent : Colors.grey.shade600),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '${day.day}',
        textScaler: TextScaler.noScaling,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFFAFAFA),
          fontSize: 20,
        ),
      ),
    );

    return switch (switcher) {
      AsyncData(value: final useColumn) => useColumn
          ? Column(
        children: [circleContainer],
      )
          : circleContainer,
      _ => circleContainer
    };
  }
}