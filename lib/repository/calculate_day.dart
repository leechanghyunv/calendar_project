import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/work_history_model.dart';

part 'calculate_day.g.dart';

/// 주휴수당을 계산한다 GPT가 코드짜줌

@riverpod
int calculateValue (CalculateValueRef ref) {
  final event = ref.watch(eventsProvider);
  calculateAdditionalHolidays(event);
  return calculateAdditionalHolidays(event);
}

int _getWeekOfYear(DateTime date) {
  final firstDayOfYear = DateTime(date.year, 1, 1);
  final daysDifference = date.difference(firstDayOfYear).inDays;
  return (daysDifference / 7).ceil();
}

int calculateAdditionalHolidays(Map<DateTime, List<WorkHistory>> list) {

  final List<DateTime> daysWithEvents = list.keys.toList();
  Map<int, Map<int, int>> yearWeekEventCount = {}; // {year: {week: eventCount}}

  for (var day in daysWithEvents) {
    final year = day.year;
    final weekOfYear = _getWeekOfYear(day);

    if (!yearWeekEventCount.containsKey(year)) {
      yearWeekEventCount[year] = {};
    }

    if (yearWeekEventCount[year]!.containsKey(weekOfYear)) {
      yearWeekEventCount[year]![weekOfYear] = yearWeekEventCount[year]![weekOfYear]! + 1;
    } else {
      yearWeekEventCount[year]![weekOfYear] = 1;
    }
  }

  int additionalHolidays = 0;
  for (var weekEventCount in yearWeekEventCount.values) {
    for (var count in weekEventCount.values) {
      if (count > 1) {
        additionalHolidays++;
      }
    }
  }
  print('Total additional holidays: $additionalHolidays');

  return additionalHolidays;
}

/// Weeklyholidayallowance

@riverpod
Map<DateTime, List<WorkHistory>> extraDay(ExtraDayRef ref,
    Map<DateTime, List<WorkHistory>> list) => {};

final eventsProvider = StateProvider<Map<DateTime, List<WorkHistory>>>((ref) {
  return {};
});