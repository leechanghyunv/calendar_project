import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../data/provider/string_list_provider.dart';
import '../provider/registration_index_provider.dart';
import '../provider/work_site_provider.dart';

import 'package:calendar_project_240727/core/widget/toast_msg.dart';


class WorkSiteDropdown extends HookConsumerWidget {
  const WorkSiteDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sitesAsync = ref.watch(stringListNotifierProvider);
    final registrationIndex = ref.watch(registrationIndexProvider);

    useEffect(() {
      final data = sitesAsync.valueOrNull;
      if (data != null && data.isNotEmpty) {
        final reversedIndex = data.length - 1;
        if (registrationIndex == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(registrationIndexProvider.notifier).setIndex(reversedIndex);
            ref.read(selectedWorksiteProvider.notifier).state = data[reversedIndex].value;
          });
        }
      }
      return null;
    }, [sitesAsync]);

    return switch (sitesAsync) {
      AsyncData(:final value) when value.isEmpty => Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[200],
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: TextWidget('업체 등록 가능', 14.5, context.width, color: context.subTextColor),
      ),
      AsyncData(:final value) => Container(
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[200],
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            value: registrationIndex,
            isDense: true,
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey.shade700, size: 17.5),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            borderRadius: BorderRadius.circular(7.5),
            dropdownColor: context.isDark ? Colors.grey.shade900 : Colors.white,
            style: TextStyle(color: context.isDark ? Colors.white : Colors.black, fontSize: 14.5),
            items: List.generate(value.length, (index) {
              final reversedIndex = value.length - 1 - index;
              return DropdownMenuItem<int>(
                value: reversedIndex,
                child: TextWidget('${value[reversedIndex].value}', 14.5, context.width),
              );
            }),
            onChanged: (selectedIndex) {
              if (selectedIndex != null) {
                ref.read(registrationIndexProvider.notifier).setIndex(selectedIndex);
                ref.read(selectedWorksiteProvider.notifier).state = value[selectedIndex].value;
                customMsg('${value[selectedIndex].value} 선택');
              }
            },
          ),
        ),
      ),
      AsyncError() => Container(
        padding: EdgeInsets.all(8),
        child: Text('오류'),
      ),
      _ => Container(
        padding: EdgeInsets.all(8),
        child: Text('로딩...'),
      ),
    };
  }
}