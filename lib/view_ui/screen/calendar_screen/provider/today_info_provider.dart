
import '../../../../repository/repository_import.dart';

part 'today_info_provider.g.dart';

@Riverpod(keepAlive: true)
class DynamicHolidays extends _$DynamicHolidays {
  @override
  Map<DateTime, String> build() {
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);

    return {
      ...holidays,
      todayKey: '오늘 📍',
    };
  }
}