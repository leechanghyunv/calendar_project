import 'package:calendar_project_240727/view_ui/widgets/elevated_button/elevated_button.dart';
import 'package:calendar_project_240727/view_ui/widgets/elevated_button/left_eleveted_button.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/duration_select_module.dart';
import '../../../widgets/info_row.dart';

void RetroactiveModal(BuildContext context){
  context.showModal(
    heightRatio: 0.8,
    child: RetroactiveScreen(),
  );
}

class RetroactiveScreen extends HookConsumerWidget {
  const RetroactiveScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final focusNode = useFocusNode();
    final isDuration = useState(true);
    final containHoliDay = useState(false);

    final selectedDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());

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
                            onPressed: (){}),
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
                            onPressed: (){}),
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
