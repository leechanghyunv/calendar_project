import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/provider/registration_index_provider.dart';

import '../../../../core/export_package.dart';
import '../../../../base_app_size.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../data/provider/string_list_provider.dart';
import '../provider/work_site_provider.dart';


class WorkSiteListView extends HookConsumerWidget {
  const WorkSiteListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sitesAsync = ref.watch(stringListNotifierProvider);
    final scrollController = useScrollController();
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

    const chipWidth = 120.0;

    final scrollToSelected = useCallback((int index, double screenWidth) {
      if (!scrollController.hasClients) return;

      if (index == 0) {
        scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        return;
      }

      final scrollPosition = (index * chipWidth) - (screenWidth / 2) + (chipWidth / 2);

      scrollController.animateTo(
        scrollPosition.clamp(0.0, scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }, [scrollController]);

    return SizedBox(
      height: 30,
      child: switch (sitesAsync){
        AsyncData(:final value) when value.isEmpty => Row(
          children: [
            TextWidget(
              ' 작업현장,업체 등록 가능',
              14,
              context.width,
              color: context.subTextColor,
            ),
          ],
        ),
        AsyncData(:final value) => ListView.separated(
          controller: scrollController,
          itemCount: value.length,
          separatorBuilder: (_, __) => const SizedBox(width: 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final reversedIndex = value.length - 1 - index;
            final isSelected = registrationIndex == reversedIndex;
            final opacity = 1.0 - (index * 0.25);

            return Opacity(
              opacity: isSelected ? 1.0 : opacity,
              child: ChoiceChip(
                label: TextWidget(
                  '#${value[reversedIndex].value}',
                  14,
                  context.width,
                  color: isSelected ? Colors.white : context.subTextColor,
                ),
                selected: isSelected,
                onSelected: (selected) {
                  scrollToSelected(reversedIndex, context.width * 0.7);
                  ref.read(registrationIndexProvider.notifier).setIndex(selected ? reversedIndex : null);
                  if (selected) {
                    ref.read(selectedWorksiteProvider.notifier).state = value[reversedIndex].value;
                    customMsg('${value[reversedIndex].value} 선택');
                  }
                  ref.read(selectedWorksiteProvider.notifier).state = '';
                },
                selectedColor: context.isDark ? Colors.teal.shade900 : Colors.teal,
                backgroundColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                showCheckmark: false,
              ),
            );
          },
        ),
        AsyncError() => Row(
          children: [
            Text('err'),
          ],
        ),
        _ => Row(
          children: [
            Text('loading.....'),
          ],
        ),
      }
    );
  }
}