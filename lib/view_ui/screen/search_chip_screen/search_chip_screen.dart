import 'package:calendar_project_240727/core/export_package.dart';

import '../../../model/work_history_model.dart';
import '../../../view_model/sqlite_model/history_model.dart';

class SearchChipScreen extends HookConsumerWidget {
  const SearchChipScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final historyAsync = ref.watch(viewHistoryProvider);

    final selectedPeriod = useState('1개월');

    final filteredResults = useMemoized(() {
      return switch (historyAsync) {
        AsyncData(:final value) => () {
          var results = value;
          // 📅 기간 필터링 (UTC 시간 포함)
          final now = DateTime.now().toUtc();
          final periodMonths = switch (selectedPeriod.value) {
            '1개월' || '최근 1개월' => 1,
            '3개월' => 3,
            '6개월' => 6,
            '12개월' => 12,
            '18개월' => 18,
            _ => 1,
          };

          final startDate = DateTime.utc(
            now.year,
            now.month - periodMonths,
            now.day,
          );

          results = results.where((history) {
            return history.date.toUtc().isAfter(startDate);
          }).toList();

          results = results.where((history) => history.memo.isNotEmpty).toList();
          // 📆 날짜 내림차순 정렬
          results.sort((a, b) => b.date.compareTo(a.date));

          return results;
        }(),
        _ => <WorkHistory>[],
      };
    }, [historyAsync, selectedPeriod.value]);


    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 30),


          ],
        ),
      ),
    );
  }
}
