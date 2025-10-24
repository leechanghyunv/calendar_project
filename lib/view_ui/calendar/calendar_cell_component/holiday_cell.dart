import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../view_model/view_provider/calendar_switcher_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';


class HolidayCell extends ConsumerWidget {

  final DateTime date;
  final Map<DateTime,String> holidays;
  
  const HolidayCell(
      this.date,
      this.holidays,
      {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth =  context.width;
    final appHeight = context.height;
    final switcher = ref.watch(calendarSwitcherProvider);
    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;
    final isLight = Theme.of(context).brightness == Brightness.light;

    final bool isExpanded = switcher.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );

    final marginSize = isExpanded

        ? appHeight < 700 ?  29.w :  (appWidth <= 370 ? 33.5.w : appWidth > 500 ? 50.0 : 35.w)

        : appHeight < 700 ?  29.w :  (appWidth <= 370 ? (appWidth > 360 ? 33.5.w : 37.w) : appWidth > 500 ? isFoldValue ? 35.0 : 50.0 : 35.0.w);



    final holidayName = holidays.entries.firstWhere(
          (entry) =>
      entry.key.year == date.year &&
          entry.key.month == date.month &&
          entry.key.day == date.day,
      orElse: () => MapEntry(date, ''),
    ).value;

    final holidayText = holidayName.replaceAll('\n', '');

    Color cellColor = date.month == ref.month
        ? isLight ? Colors.teal : Colors.tealAccent
        : Colors.transparent;

    if (date.weekday == DateTime.saturday && date.month == ref.month) {
      cellColor = Colors.blue;
    }

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: marginSize,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Theme.of(context).scaffoldBackgroundColor,

      ),
      child: Column(
        children: [
          Spacer(),

          Text(
            holidayText,
            maxLines: 1,
            textScaler: TextScaler.noScaling,
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontWeight: FontWeight.w800,
              height: Platform.isAndroid ? 1.2 : null,
                fontSize: appWidth > 450 ? 10.5 : 8.5,
                color: cellColor,
            ),
          ),
          Spacer(),
          if (isExpanded) ...List.generate(6, (_) => Spacer()),
        ],
      ),
    );
  }
}
