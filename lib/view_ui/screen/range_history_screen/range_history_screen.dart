import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';
import 'package:calendar_project_240727/view_model/filted_instance_model/search_source_model.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/range_history_board.dart';
import 'package:calendar_project_240727/view_ui/widgets/svg_imoji.dart';
import 'package:calendar_project_240727/view_ui/widgets/text_field_bar.dart';
import '../../../base_app_size.dart';
import '../../../core/utils/converter.dart';
import '../../../view_model/sqlite_model/selected_model.dart';
import 'component/range_date_box.dart';

class RangeHistoryScreen extends HookConsumerWidget {
  const RangeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final dateRange = ref.watch(timeRangeManagerProvider);
    final state = ref.watch(searchSourceModelProvider);

    final historyMemoController = useTextEditingController();
    final historyMemoFocus = useFocusNode();

    Widget _InfoRow(String label, String value, [double fontSize = 15]) {
      return Row(
        children: [
          TextWidget(label, fontSize, context.width, color: context.subTextColor),
          Spacer(),
          TextWidget(value, fontSize, context.width, color: context.textColor),
        ],
      );
    }

    Widget _StateContainer(String msg) => Container(
      height: height / 1.7,
      alignment: Alignment.center,
      child: TextWidget(msg, 15, width),
    );

    void handleSave() {
      final value = state.value;
      if (value == null) return;

      ref.read(
        addSelectedProvider(
          dateRange.startDate,
          dateRange.endDate,
          value.tax / 100,
          historyMemoController.text,
          '',
        ).future,
      );
      Navigator.pop(context);
      customMsg('기록이 저장되었습니다');
      HapticFeedback.selectionClick();
    }

    return switch (state) {
      AsyncData(:final value) => RangeHistoryBoard(
        header: RangeDateRow(
          startDate: '${formatSelectedDate(dateRange.startDate)}',
          endDate: '${formatSelectedDate(dateRange.endDate)}',
        ),
        children: [
          height > 750
              ? SizedBox(height: context.width > 400 ? 20 : 15)
              : SizedBox(height: 2.5),
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _InfoRow('누적금액', '${formatAmount(value.total.toInt())}'),
                          SizedBox(height: width > 400 ? 22.5 : width > 376 ? 17 : 20),
                          _InfoRow('누적공수', '${value.record.toStringAsFixed(1)}공수'),
                          SizedBox(height: width > 400 ? 22.5 : width > 376 ? 17 : 20),
                          _InfoRow('세후(${value.tax}%)','${formatAmount(value.afterTax.toInt())}'),
                          SizedBox(height: width > 400 ? 22.5 : width > 376 ? 17 : 20),
                          _InfoRow('퇴직공제금액', '${value.severancePay.toStringAsFixed(1)}만원'),
                          SizedBox(height: width > 400 ? 22.5 : width > 376 ? 17 : 20),
                          _InfoRow('근로신고일수', '233일'),
                          SizedBox(height: width > 400 ? 22.5 : width > 376 ? 17 : 20),
                          _InfoRow('총 출력일수', '${value.workDay}일'),
                          SizedBox(height: width > 400 ? 22.5 : width > 376 ? 17 : 20),
                          _InfoRow('근로공제일수', '${value.wrd}일'),
                          SizedBox(height: width > 400 ? 22.5 : width > 376 ? 17 : 20),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1.0,
                  ),
                  SizedBox(height: context.width > 400 ? 20 : 15),
                  Row(
                    children: [
                      ChipImoJi(
                        name: 'check',
                        width: 14,
                      ),
                      SizedBox(width: 5),
                      TextWidget('저장된 이력은 누적기록에서 확인하세요', 14,
                          context.width,
                          color: context.subTextColor,
                      ),
                    ],
                  ),
                  


                ],
              ),
            ),
          ),
        ],
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Row(
            children: [
              Expanded(
                child: TextFieldBar(
                  controller: historyMemoController,
                  focusNode: historyMemoFocus,
                  hintText: ' 업체,현장 등록 후 저장',
                  onPressed: () => handleSave(),
                  onSubmitted: (val) => handleSave(),
                  icon: Icons.check,
                ),
              ),
            ],
          ),
        ),
      ),

      AsyncLoading() => _StateContainer('loading...'),
      _ => _StateContainer('데이터를 불러올 수 없습니다'),

    };
  }
}
