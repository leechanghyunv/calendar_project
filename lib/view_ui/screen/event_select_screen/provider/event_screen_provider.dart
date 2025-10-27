import '../../../../repository/repository_import.dart';

part 'event_screen_provider.g.dart';

@riverpod
class EventScreen extends _$EventScreen {

  @override
  bool build() => true;

  void switchScreen(bool val) => state = val;
}