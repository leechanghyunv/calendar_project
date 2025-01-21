import 'package:calendar_project_240727/core/export_package.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/widget/toast_msg.dart';
import '../../model/work_history_model.dart';
import '../../view_model/calendar_event_model.dart';
import '../../view_model/filted_source_model.dart';
import '../../view_model/history_model.dart';
import '../time/calendar_time_controll.dart';

part 'back_up_service.g.dart';

@riverpod
class BackUpServiceProvider extends _$BackUpServiceProvider {

  @override
  AsyncValue<void> build() => AsyncValue.data(null);

    Future<void> processWorkHistory(BuildContext context,List<WorkHistory>? workHistoryList) async {

      state = const AsyncValue.loading();
      customMsg('loading....'); /// loading message

      state = await AsyncValue.guard(() async {
        final timeManager = ref.watch(timeManagerProvider);
        final combinedData = ref.watch(numericSourceModelProvider(timeManager.selected));

        return await combinedData.when(
            data: (val) async {
              if (val.contract.isEmpty) {
                 customMsg('근로조건을 먼저 저장해주세요.');
                 return; // 추가
              }
              if (workHistoryList == null) {
                customMsg('공수기록을 전부 붙여넣지 않았습니다\n맨 뒤 내용까지 확인해서 붙여넣어주세요'
                );
                return; // 추가
              }


              await ref.read(addAllHistoryProvider(workHistoryList).future);
              customMsg('공수 기록이 저장되었습니다.\n이제 앱을 다시 시작해주세요');
              await Future.delayed(const Duration(milliseconds: 500) ,(){
                ref.refresh(calendarEventProvider);
                ref.read(timeManagerProvider.notifier).selectedNextDay();
                Navigator.pushReplacementNamed(context, '/main');
              });
            },
            error: (err, trace) => throw err,
            loading: () => customMsg('loading....'),
        );
      });
    }
}

