import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extentions/theme_color.dart';
import '../../../../view_model/sort_type_provider.dart';

class FilterHistoryChip extends HookConsumerWidget {
  const FilterHistoryChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> options = ['누적금액', '근로공수', '공사기간'];
    final selectedValue = useState<String?>(null); // hooks로 상태 관리

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    // 옵션 → SortBy 매핑
    SortBy getSortByFromOption(String option) {
      return switch (option) {
        '누적금액' => SortBy.money,
        '근로공수' => SortBy.record,
        '공사기간' => SortBy.duration,
        _ => SortBy.money,
      };
    }


    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: options.map((option) {
        final bool isSelected = selectedValue.value == option;

        return GestureDetector(
          onTap: () {
            selectedValue.value = option; // option 변수 사용
            final sortBy = getSortByFromOption(option);
            ref.read(sortTypeNotifierProvider.notifier).setSortBy(sortBy);
            },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: height > 750 ? (width > 400 ? 27 : 25) : width < 350 ? 21.5 : 24,
            padding: EdgeInsets.symmetric(horizontal: width > 370 ? 8 : 4, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected ? context.selectedChipColor : context.chipColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? Colors.grey.shade600 : Colors.grey.shade400,
                width: isSelected ? 1.5 : 1.25,
              ),
              boxShadow: context.defaultShadow,
            ),
            child: TextWidget('#$option', 13, context.width,color: isSelected ? context.textColor : context.chipTextColor),
          ),
        );
      }).toList(),
    );
  }
}