import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../calendar_screen/provider/show_range_provider.dart';

class DateRangeInputField extends HookConsumerWidget {
  final FocusNode rangeNode;
  final String labelText;
  final ValueChanged<List<DateTime>?> onDateRangeChanged;

  const DateRangeInputField({
    Key? key,
    this.labelText = 'YY/MM/DD ~ YY/MM/DD',
    required this.rangeNode,
    required this.onDateRangeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final  showRange = ref.watch(showRangeStateProvider);


    // MaskTextInputFormatter로 자동 포맷팅
    final maskFormatter = useMemoized(
          () => MaskTextInputFormatter(
        mask: '##.##.## ~ ##.##.##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy,
      ),
    );

    final controller = useTextEditingController();

    // 텍스트 변경 감지 및 날짜 파싱
    useValueListenable(controller).text;
    useEffect(() {
      void listener() {
        final text = controller.text;
        final dateRange = _parseDateRange(text);
        onDateRangeChanged(dateRange);
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    return Container(
      height: 25,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: TextField(
        focusNode: rangeNode,
        cursorColor: context.subTextColor,
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [maskFormatter],
        decoration: InputDecoration(
          hintText: ' 25.01.01 ~ 25.12.31',
          isDense: true,
          hintStyle: TextStyle(
            color: showRange ? Colors.teal.shade700 : context.subTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: 1.25,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
      ),
    );
  }

  List<DateTime>? _parseDateRange(String text) {
    // "YY.MM.DD ~ YY.MM.DD" 형식 파싱
    final parts = text.split(' ~ ');
    if (parts.length != 2) return null;

    final startDate = _parseDate(parts[0]);
    final endDate = _parseDate(parts[1]);

    if (startDate == null || endDate == null) return null;
    if (startDate.isAfter(endDate)) return null;

    return [startDate, endDate];
  }

  DateTime? _parseDate(String dateStr) {
    final parts = dateStr.split('.');
    if (parts.length != 3) return null;

    try {
      final year = int.parse('20${parts[0]}');
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      if (month < 1 || month > 12) return null;
      if (day < 1 || day > 31) return null;

      // 실제 날짜 유효성 검증
      final date = DateTime(year, month, day);
      if (date.month != month || date.day != day) return null;

      return date;
    } catch (_) {
      return null;
    }
  }
}