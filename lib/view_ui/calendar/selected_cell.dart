
import 'package:calendar_project_240727/core/export_package.dart';

import '../../view_model/view_provider/calendar_switcher_model.dart';


class SelectedCell extends ConsumerWidget {
  final DateTime day;

  const SelectedCell(this.day, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switcher = ref.watch(calendarSwitcherProvider);
    final bool isExpanded = switcher.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );
    final circleContainer = Container(
      width: 40,
      height: isExpanded ? 50 : 100,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
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