import '../../../../repository/repository_import.dart';

part 'today_info_provider.g.dart';

@Riverpod(keepAlive: true)
class DynamicHolidays extends _$DynamicHolidays {

  @override
  Map<DateTime, String> build() {

    // final customEvents = await ref.watch(customEventViewModelProvider.future);

    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);
    final result = Map<DateTime, String>.from(holidays);

    result[todayKey] = '오늘';


    /// holidays - result
    return holidays;
  }

}