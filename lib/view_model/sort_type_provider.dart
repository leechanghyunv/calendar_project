
import '../repository/repository_import.dart';

part 'sort_type_provider.g.dart';

enum SortBy { money, record, duration, time }

@riverpod
class SortTypeNotifier extends _$SortTypeNotifier {

  @override
  SortBy build() => SortBy.time; // 기본값을 최신순으로

  void setSortBy(SortBy sortBy) {
    state = sortBy;
  }
}