
import '../../../core/export_package.dart';
import '../../../view_model/view_provider/calendar_switcher_model.dart';

class TodayCell extends ConsumerWidget {
  final DateTime day;

  const TodayCell(this.day, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final switcher = ref.watch(calendarSwitcherProvider);
    final appHeight = MediaQuery.of(context).size.height;
    final bool isExpanded = switcher.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );




    final circleContainer = Container(
      width: appHeight < 700 ? 35 : 40,
      height: isExpanded ? 50 : 100,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '${day.day}',
        textScaler: TextScaler.noScaling,
        style: TextStyle(
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
