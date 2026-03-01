
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/screen/search_chip_screen/provider/calculate_textHeight.dart';
import 'package:calendar_project_240727/view_ui/screen/search_chip_screen/search_chip_use_cases.dart';
import 'package:calendar_project_240727/view_model/selected_memo_filter.dart';

class FullTextBoxAnimated extends HookConsumerWidget {
  const FullTextBoxAnimated({super.key, required this.fontSize});

  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMemos = ref.watch(selectedMemoFilterProvider);
    final dismissedMemo = useState<String?>(null);

    final selectedLongMemo = useSelectedLongMemo(
      selectedMemos: selectedMemos,
      dismissedMemo: dismissedMemo.value,
    );

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: selectedLongMemo != null
          ? calculateTextHeight(selectedLongMemo, context).clamp(0, 300)
          : 10,
      curve: Curves.easeInOut,
      child: selectedLongMemo != null
          ? GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          dismissedMemo.value = selectedLongMemo;
          ref.read(selectedMemoFilterProvider.notifier).toggle(selectedLongMemo);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: context.isDark ? Colors.black54 : Colors.teal[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.isDark ? Colors.tealAccent : Colors.teal,
              width: 1,
            ),
          ),
          child: Text(
            selectedLongMemo,
            style: TextStyle(
              color: context.isDark ? Colors.white : Colors.teal[800],
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      )
          : SizedBox.shrink(),
    );
  }
}