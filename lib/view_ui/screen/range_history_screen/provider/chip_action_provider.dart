

import 'package:calendar_project_240727/base_consumer.dart';

import '../../../../repository/repository_import.dart';
import '../../../../repository/time/date_range_controller.dart';
import '../entities/optinos_enum.dart';

part 'chip_action_provider.g.dart';


@riverpod
class ChipActionValue extends _$ChipActionValue {
  @override
  void build() {}

  void handleAction(String action, BuildContext context,WidgetRef ref) {
    final dateRange = ref.watch(timeRangeManagerProvider);

    if (action == ChipAction.delete.label) {
      ref.read(deleteMonthHistoryProvider(dateRange.startDate,dateRange.endDate));
      Navigator.of(context, rootNavigator: true).pop();
      ref.refreshState(context);
      customMsg('선택하신 기간이 삭제되었습니다.');
    } else if (action == ChipAction.save.label) {
      customMsg('누적기록에서 저장된 데이터 확인가능');
    } else if (action == ChipAction.tax.label) {
      customMsg('세율조정');
    } else if (action == ChipAction.exit.label) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  }


