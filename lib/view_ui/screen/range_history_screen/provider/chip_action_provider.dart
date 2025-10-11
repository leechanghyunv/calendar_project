

import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/provider/show_memo_history_provider.dart';

import '../../../../core/widget/text_widget.dart';
import '../../../../repository/repository_import.dart';
import '../../../../repository/time/date_range_controller.dart';
import '../entities/optinos_enum.dart';

part 'chip_action_provider.g.dart';


@riverpod
class ChipActionValue extends _$ChipActionValue {
  @override
  void build() {}

  void handleAction(String action, BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final dateRange = ref.watch(timeRangeManagerProvider);

    if (action == ChipAction.delete.label) {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            backgroundColor:  context.dialogColor,
            shape: context.dialogShape,
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextWidget('공수기록을 모두 삭제하시겠습니까?',
                  15,appWidth,color: context.textColor),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: TextWidget('취소', 15,
                    appWidth,color: context.textColor),
              ),
              TextButton(
                onPressed: () {
                  deleteMonthHistoryProvider(dateRange.startDate,dateRange.endDate);
                  ref.refreshState(context);
                  Navigator.of(context, rootNavigator: true).pop();
                  customMsg('선택하신 기간이 삭제되었습니다.');
                },
                child: TextWidget('삭제', 15,appWidth,
                    color: context.textColor),
              ),
            ],
          ),
      );

    } else if (action == ChipAction.save.label) {
      ref.read(showMemoHistoryStateProvider.notifier).historyMemoState();
    } else if (action == ChipAction.tax.label) {
      customMsg('세율조정');
    } else if (action == ChipAction.exit.label) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  }


