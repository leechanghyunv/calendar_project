import '../time/calendar_time_controll.dart';
import '../repository_import.dart';
part 'back_up_service.g.dart';

@riverpod
class BackUpServiceProvider extends _$BackUpServiceProvider {

  @override
  AsyncValue<void> build() => AsyncValue.data(null);

    Future<void> processWorkHistory(BuildContext context,List<WorkHistory>? workHistoryList) async {

      state = const AsyncValue.loading();
      customMsg('loading....'); /// loading message

      state = await AsyncValue.guard(() async {

        final contract = ref.watch(viewContractProvider);

        return await contract.maybeWhen(
            data: (val) async {
              if (val.isEmpty) {
                customMsg('근로조건을 먼저 저장해주세요.');
                return; // 추가
              }
              if (workHistoryList == null) {
                customMsg('공수기록을 전부 붙여넣지 않았습니다\n맨 뒤 내용까지 확인해서 붙여넣어주세요'
                );
                return; // 추가
              }

              await ref.read(addAllHistoryProvider(workHistoryList).future);
              customMsg('공수 기록이 저장되었습니다.');
              await Future.delayed(const Duration(milliseconds: 500) ,(){
                ref.refresh(calendarEventProvider);
                ref.read(timeManagerProvider.notifier).selectedNextDay();
              });
            },
            orElse: (){}
        );



      });
    }
}

