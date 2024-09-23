import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/work_history_model.dart';

part 'calculate_day.g.dart';

/// 주휴수당을 계산한다 GPT가 코드짜줌

/// 실업급여기준은 18개월 이내 180일이다.
/// 건설근로자 퇴직금 공제 기준일은 252일이다. 하루 금액이 6200원인지,6400원인지,6500원인지 정확하지 않다.

@riverpod
int calculateValue (CalculateValueRef ref) {
  final event = ref.watch(eventsProvider);

  return calculateAdditionalHolidays(event);
}

/// year to day
int _getWeekOfYear(DateTime date) {
  final firstDayOfYear = DateTime(date.year, 1, 1);
  final daysDifference = date.difference(firstDayOfYear).inDays;
  return (daysDifference / 7).ceil();
}

int calculateAdditionalHolidays(Map<DateTime, List<WorkHistory>> list) {

  final DateTime now = DateTime.now();
  final DateTime cutoffDate = DateTime(now.year, now.month - 18, now.day);

  final List<DateTime> daysWithEvents = list.keys
      .where((date) => date.isAfter(cutoffDate)) // 18개월 이전의 날짜는 제외
      .toList();

  Map<int, Map<int, int>> yearWeekEventCount = {};
  Map<int, Map<int, int>> weekRecord2Count = {};  /// 야간일 경우 주휴일수 1일 추가


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

  /// print('Total additional holidays: $additionalHolidays');

  return additionalHolidays;
}

/// Weeklyholidayallowance

@riverpod
Map<DateTime, List<WorkHistory>> extraDay(ExtraDayRef ref,
    Map<DateTime, List<WorkHistory>> list) => {};

final eventsProvider = StateProvider<Map<DateTime, List<WorkHistory>>>((ref) {
  return {};
});