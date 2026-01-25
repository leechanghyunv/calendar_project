import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../../core/export_package.dart';

class QuickSelectChipList extends HookConsumerWidget {
  final List<double> values;
  final double currentValue;
  final ValueChanged<double> onValueSelected;

  const QuickSelectChipList({
    required this.values,
    required this.currentValue,
    required this.onValueSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: context.width > 400 ? 32 : 25, // 칩 높이에 맞춰 조정
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: values.length,
                itemBuilder: (context, index) {
                  final value = values[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index < values.length - 1
                          ? context.width > 450
                                ? 12.0
                                : 8.0
                          : 0,
                    ),
                    child: QuickSelectChip(
                      value: value,
                      currentValue: currentValue,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        onValueSelected(value);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class QuickSelectChip extends StatelessWidget {
  final double value;
  final double currentValue;
  final VoidCallback onTap;

  const QuickSelectChip({
    super.key,
    required this.value,
    required this.currentValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentValue == value;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? context.isDark
                    ? Colors.teal.shade900
                    : Colors.teal
              : context.chipColor,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: isSelected ? 2.25 : 1.75,
            color: isSelected
                ? context.isDark
                      ? Colors.teal
                      : Colors.teal
                : Colors.grey.shade300,
          ),
        ),
        height: 30,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: context.width >= 450
                ? 16.5
                : context.width >= 400
                ? 14.5
                : 12,
          ),
          child: TextWidget(
            value.toStringAsFixed(2),
            15,
            context.width,
            color: isSelected ? Colors.white : context.textColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
