import 'package:calendar_project_240727/core/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'showcase_global_key.g.dart';

final globalKeyProvider = Provider<GlobalKey>((ref) {
  return GlobalKey();
});

@riverpod
Future<void> showCaseStart(ShowCaseStartRef ref,BuildContext context) async {
  final showCaseGlobalKey = ref.watch(globalKeyProvider);
  ShowCaseWidget.of(context).startShowCase([showCaseGlobalKey]);
}