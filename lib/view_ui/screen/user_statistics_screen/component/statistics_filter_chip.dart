import 'package:calendar_project_240727/core/widget/toast_msg.dart';

import '../../../../core/export_package.dart';
import '../../../../data/usecases/supabase_provider.dart';
import '../../../../theme_color.dart';
import '../provider/selected_site_provider.dart';

class StatisticsFilterChip extends HookConsumerWidget {
  const StatisticsFilterChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> options = ['하이테크', '일반현장', '조선소','플랜트','전체'];
    final selectedValue = useState<String?>(null);
    final _scrollController = useScrollController(); // 🎯 스크롤 컨트롤러 추가

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final chipExtraWidth = width > 370 ? 16.0 : 8.0; // 패딩에 따른 추가 너비

    final _scrollToSelected = useCallback((int index, double screenWidth) {
      if (_scrollController.hasClients) {
        double totalWidth = 0;
        for (int i = 0; i < index; i++) {
          final textWidth = options[i].length * 8.0; // 대략적인 글자 너비
          totalWidth += textWidth + chipExtraWidth + 8.0; // 패딩 + 마진
        }

        final currentChipWidth = options[index].length * 8.0 + chipExtraWidth;
        final scrollPosition = totalWidth - (screenWidth / 2) + (currentChipWidth / 2);

        _scrollController.animateTo(
          scrollPosition.clamp(
            0.0,
            _scrollController.position.maxScrollExtent,
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }, [_scrollController, options]);

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: height > 750 ? (width > 400 ? 27 : 25) : 24,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: options.length,
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
                        customMsg('전체 통계');
                      } else {
                        ref.read(payStatsNotifierProvider.notifier).showSiteStats(option);
                        customMsg('${option} 통계');
                      }
                      _scrollToSelected(index, width);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: height > 750 ? (width > 400 ? 27 : 25) : 24,
                      padding: EdgeInsets.symmetric(horizontal: width > 370 ? 8 : 4, vertical: 4),
                      decoration: BoxDecoration(
                        color:
                        option == '전체' ? Colors.green.shade100 :
                        isSelected ? Colors.grey.shade300 : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: option == '전체' ? Colors.green.shade400 :
                          isSelected ? Colors.grey.shade600 : Colors.grey.shade400,
                          width: isSelected ? 1.5 : 1.25,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        option == '전체' ? '@${option}' : '#$option',
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          height: textHeight,
                          letterSpacing: Platform.isAndroid ? 1.0 : null,
                          fontSize: height > 750
                              ? (width > 400 ? 15 : width < 370 ? 11.5 : 12.5)
                              : 11.5,
                          fontWeight: FontWeight.bold,
                          color: option == '전체' ? Colors.green.shade900 :
                          isSelected ? Colors.black : Colors.grey.shade800,
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