import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/widgets/elevated_button/elevated_button.dart';
import 'package:calendar_project_240727/view_ui/widgets/elevated_button/left_eleveted_button.dart';
import 'package:dartx/dartx.dart';

import '../../../../base_consumer.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/duration_select_module.dart';
import '../../../widgets/info_row.dart';
import '../../contract_setting_screen/component/number_picker_modal.dart';

void RetroactiveModal(
    BuildContext context,{required int subsidyAmount}){
  context.showModal(
    heightRatio: 0.8,
    child: RetroactiveScreen(subsidy: subsidyAmount),
  );
}

class RetroactiveScreen extends HookConsumerWidget {

  final int subsidy;

  const RetroactiveScreen({super.key, required this.subsidy});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final focusNode = useFocusNode();
    final isDuration = useState(true);
    final containHoliDay = useState(false);

    final selectedDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());

    final historyAsync = ref.watch(viewHistoryProvider);
    final histories = historyAsync.valueOrNull;

    useEffect(() {
      if (histories != null && histories.isNotEmpty) {
        selectedDate.value = histories.minBy((h) => h.date)?.date ?? DateTime.now();
        endDate.value = histories.maxBy((h) => h.date)?.date ?? DateTime.now();
      }
      return null;
    }, [histories]);

    void _closeAndNavigate(BuildContext context) {
      HapticFeedback.selectionClick();
      Navigator.pop(context);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.refreshState(context);
        NumberPickerModal(context);
      });
    }

    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Row(
                  children: [
                    InfoRow(
                      title: '일비 등록하기',
                      subtitle: '공수 설정시 자동으로 반영됩니다.',
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: InkWell(
                        onTap: (){
                          HapticFeedback.selectionClick();
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Icon(Icons.keyboard_arrow_down,
                            color: context.isDark ? Colors.white : Colors.grey.shade700,
                            size: 25),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                DurationSelectModule(
                  focusNode: focusNode,
                  isDuration: isDuration,
                  containHoliDay: containHoliDay,
                  selectedDate: selectedDate,
                  endDate: endDate,
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextWidget(
                        '다음 공수 등록부터 자동으로 일비 추가 적용', 13.5,
                        color: context.subTextColor
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: .min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: LeftElevatedButton(
                            text: '일비 등록만 하고 나가기',
                          onPressed: () {
                            _closeAndNavigate(context);
                            customMsg('다음 공수등록에 반영됩니다');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                            text: '선택한 기간에 일비 추가',
                          onPressed: () async {
                            await ref.read(updateSubsidyHistoryProvider(
                                selectedDate.value, endDate.value, subsidy));
                            _closeAndNavigate(context);
                            customMsg('일비가 추가되었습니다');
                          }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
