import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';

import '../../../../core/export_package.dart';
import '../../../../data/usecases/supabase_provider.dart';
import '../../../../core/extentions/theme_color.dart';
import '../provider/selected_site_provider.dart';

class StatisticsFilterChip extends HookConsumerWidget {

  final ScrollController nestedScrollController;

  const StatisticsFilterChip(this.nestedScrollController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> options = ['하이테크', '일반현장', '조선소','플랜트','전체'];
    final selectedValue = useState<String?>(null);
    final _scrollController = useScrollController(); // 🎯 스크롤 컨트롤러 추가

    final double height = context.height;
    final double width = context.width;

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: height > 750 ? (width > 400 ? 27 : 25) : 24,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: options.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final option = options[index];
                final bool isSelected = selectedValue.value == option;

                return Padding(
                  padding: EdgeInsets.only(right: index == options.length - 1 ? 0 : 8.0),
                  child: GestureDetector(
                    onTap: () {
                      selectedValue.value = option;
                      ref.read(selectedSiteProvider.notifier).setSite(option);
                      if (option == '전체') {
                        ref.read(payStatsNotifierProvider.notifier).showAllStats();
                        ref.read(electricJobStatsNotifierProvider.notifier).fetchBySite('');
                        customMsg('전체 통계');
                      } else {
                        ref.read(payStatsNotifierProvider.notifier).showSiteStats(option);
                        ref.read(electricJobStatsNotifierProvider.notifier).fetchBySite(option);
                        customMsg('${option} 통계');
                      }
                      nestedScrollController.animateTo(
                        nestedScrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      // _scrollToSelected(index, width);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: height > 750 ? (width > 400 ? 27 : 25) : 24,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color:
                        option == '전체' ?  context.idChipColor :
                        isSelected ? context.selectedChipColor : context.chipColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: option == '전체' ? context.idChipBorderColor :
                          isSelected ? Colors.grey.shade600 : Colors.grey.shade400,
                          width: isSelected ? 1.5 : 1.25,
                        ),
                        boxShadow: context.defaultShadow,
                      ),
                      child: Text(
                        option == '전체' ? '@${option}' : '#$option',
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          height: textHeight,
                          letterSpacing: null,
                          fontSize: height > 750
                              ? (width > 400 ? 14 : width < 370 ? 11.5 : 12.5)
                              : 11.5,
                          fontWeight: FontWeight.bold,
                          color: option == '전체' ? context.idChipTextColor :
                          isSelected ? context.textColor : context.chipTextColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),


      ],
    );
  }
}