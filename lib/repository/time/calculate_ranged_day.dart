
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../model/work_history_model.dart';
import 'calculate_day.dart';

part 'calculate_ranged_day.g.dart';

@riverpod
int calculatedRange(CalculatedRangeRef ref, DateTime start, DateTime end) {

  final event = ref.watch(eventsProvider);
  return calculateAdditionalHolidays(event,start,end);

  }


int _getWeekOfYear(DateTime date) {
  final firstDayOfYear = DateTime(date.year, 1, 1);
  final daysDifference = date.difference(firstDayOfYear).inDays;
  return (daysDifference / 7).ceil();
}

int calculateAdditionalHolidays(Map<DateTime, List<WorkHistory>> list,DateTime start,DateTime end) {

  final List<DateTime> daysWithEvents = list.keys
      .where((date) => date.isAfter(start) && date.isBefore(end)) // 18개월 이전의 날짜는 제외
      .toList();

  Map<int, Map<int, int>> yearWeekEventCount = {};
  Map<int, Map<int, int>> weekRecord2Count = {};

  for (var day in daysWithEvents) {
    final year = day.year;
    final weekOfYear = _getWeekOfYear(day);

    if (!yearWeekEventCount.containsKey(year)) {
      yearWeekEventCount[year] = {};
      weekRecord2Count[year] = {};
    }

    if (yearWeekEventCount[year]!.containsKey(weekOfYear)) {
      yearWeekEventCount[year]![weekOfYear] = yearWeekEventCount[year]![weekOfYear]! + 1;
    } else {
      yearWeekEventCount[year]![weekOfYear] = 1;
    }

    final eventsOnDay = list[day]!;
    for (var event in eventsOnDay){
      if(event.record == 2.0){
        if (weekRecord2Count[year]!.containsKey(weekOfYear)) {
          weekRecord2Count[year]![weekOfYear] = weekRecord2Count[year]![weekOfYear]! + 1;
        } else {
          weekRecord2Count[year]![weekOfYear] = 1;
        }
      }
    }

  }

  int additionalHolidays = 0;
  for (var year in yearWeekEventCount.keys) {
    for (var week in yearWeekEventCount[year]!.keys) {
      // 해당 주에 2개 이상의 이벤트가 있는 경우 추가 휴일 추가
      if (yearWeekEventCount[year]![week]! > 1) {
        additionalHolidays++;
      }
      // 해당 주에 record가 2.0인 이벤트가 있는 경우 추가 휴일 추가
      if (weekRecord2Count[year]!.containsKey(week)) {
        additionalHolidays += weekRecord2Count[year]![week]!;
      }
    }
  }

  return additionalHolidays;
}