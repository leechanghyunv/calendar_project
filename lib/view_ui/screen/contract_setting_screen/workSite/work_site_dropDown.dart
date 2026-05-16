import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../data/entities/string_item.dart';
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
        child: TextWidget('업체 등록 가능', 14.5, color: context.subTextColor),
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
                child: TextWidget('${value[reversedIndex].value}', 14.5),
              );
            }),
            onChanged: (selectedIndex) async {
              if (selectedIndex != null) {
                ref.read(registrationIndexProvider.notifier).setIndex(selectedIndex);
                /// setIndex는 단순 순서만 int만 관리한다
                ref.read(selectedWorksiteProvider.notifier).state = value[selectedIndex].value;
                /// selectedWorksiteProvider는 단순 현장명을 기억하고 전달한다
                final reorderedList = List<StringItem>.from(value);
                final selected = reorderedList.removeAt(selectedIndex);
                reorderedList.add(selected);
                /// 리스트재배치인데 selected된 현장명이 제일 마지막으로 온다.

                await ref.read(stringListNotifierProvider.notifier).reorder(reorderedList);
                /// StringListProvider 이건 sqlite에 영구저장되는데 리스트를 제배치한다.

                await Future.delayed(Duration(milliseconds: 100));

                ref.read(registrationIndexProvider.notifier).setIndex(value.length - 1);
                ref.read(selectedWorksiteProvider.notifier).state = selected.value;

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