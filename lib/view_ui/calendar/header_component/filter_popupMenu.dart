import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_model/filted_instance_model/filted_month_model.dart';
import 'package:calendar_project_240727/view_model/view_provider/selected_companise_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../base_consumer.dart';
import '/core/export_package.dart';

class FilterPopupMenu extends HookConsumerWidget {
  const FilterPopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final monthHistory = ref.watch(monthRecordProvider(ref.selected));

    return PopupMenuButton<void>(
      offset: Offset(20, 30),
      color: context.isDark ? Colors.black87 : null,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<void>>[
        PopupMenuItem<void>(
          enabled: false,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: StatefulBuilder(
            builder: (context, setState) {
              final selectedCompanies = ref.watch(selectedCompaniesModelProvider);
              return switch (monthHistory) {
                AsyncData(:final value) when value.workSites.isNotEmpty => Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: value.workSites.map((item) {
                    final company = item;
                    final isSelected = selectedCompanies.contains(company);
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        ref.read(selectedCompaniesModelProvider.notifier).toggle(company);
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isSelected ? Icons.check_box_outline_blank : Icons.check_box,
                            size: 18,
                            color: isSelected
                                ? (context.isDark ? Colors.white54 : Colors.black54) : Colors.teal,
                          ),
                          SizedBox(width: 4),
                          Text(
                            company,
                            textScaler: TextScaler.noScaling,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: context.isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                AsyncData() => TextWidget(' 등록된 현장이 없습니다', 13, context.width,
                color: context.subTextColor),
                _ => SizedBox.shrink(),
              };
            },
          ),
        ),
      ],
      child: Icon(
        MdiIcons.tuneVariant,
        size: 20,
      ),
    );
  }
}

