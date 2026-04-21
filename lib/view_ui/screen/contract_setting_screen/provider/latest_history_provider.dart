import 'package:dartx/dartx.dart';

import '../../../../repository/repository_import.dart';

part 'latest_history_provider.g.dart';

@riverpod
class latestHistoryList extends _$latestHistoryList {

  @override
  Future<List<WorkHistory>> build() async {
    final history = ref.watch(viewHistoryProvider).valueOrNull ?? [];

    return history
        .sortedByDescending((e) => e.date)
        .take(6)
        .toList();
  }
}
