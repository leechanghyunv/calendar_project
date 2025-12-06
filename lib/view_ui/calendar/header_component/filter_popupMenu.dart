import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_model/view_provider/selected_companise_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '/core/export_package.dart';

class FilterPopupMenu extends HookConsumerWidget {
  const FilterPopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = ['세보MEC', '유창전기', '파라텍(직발)','벽산이엔지'];

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
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: companies.map((company) {
                  final isSelected = selectedCompanies.contains(company);
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      HapticFeedback.selectionClick();
                      ref.read(selectedCompaniesModelProvider.notifier).toggle(company);
                      setState(() {}); // UI만 리빌드
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                          size: 18,
                          color: isSelected
                              ? Colors.teal
                              : (context.isDark ? Colors.white54 : Colors.black54),
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
              );
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