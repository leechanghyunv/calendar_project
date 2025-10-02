import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';

import '../../../core/widget/text_widget.dart';


// 📊 기간 선택 위젯
class PeriodSelectorWidget extends StatelessWidget {
  final ValueNotifier<String> selectedPeriod;
  final List<String> periods;

  const PeriodSelectorWidget({
    super.key,
    required this.selectedPeriod,
    required this.periods,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: periods.length,
          itemBuilder: (context, index) {
            final period = periods[index];
            final isSelected = selectedPeriod.value == period;

            return _PeriodChip(
              period: period,
              isSelected: isSelected,
              onSelected: () => selectedPeriod.value = period,
            );
          },
        ),
      ),
    );
  }
}

// 📅 개별 기간 칩
class _PeriodChip extends StatelessWidget {
  final String period;
  final bool isSelected;
  final VoidCallback onSelected;

  const _PeriodChip({
    required this.period,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: ChoiceChip(
        label: TextWidget(period,14,context.width),
        selected: isSelected,
        onSelected: (_) => onSelected(),
        selectedColor: Colors.grey[300],
        backgroundColor: Colors.grey[100],
        labelStyle: TextStyle(
          color: isSelected ? Colors.black : Colors.grey.shade800,
          fontSize: isSelected ? 14.5 : 13,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5),
        ),
        side: BorderSide.none,
      ),
    );
  }
}