import 'package:calendar_project_240727/core/widget/toast_msg.dart';

import '../../../../core/export_package.dart';
import '../../../../base_app_size.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';


class WorkSiteListView extends HookConsumerWidget {
  const WorkSiteListView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final sites = ['세보MEC', '유창', '파라텍','세안'];
    final selectedIndex = useState<int?>(null);


    return SizedBox(
      height: 30,
      child: ListView.separated(
        itemCount: sites.length,
        separatorBuilder: (_, __) => SizedBox(width: 6),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex.value == index;
          final opacity = 1.0 - (index * 0.25); // 인덱스마다 15%씩 투명도 감소
          return Opacity(
            opacity: isSelected ? 1.0 : opacity,
            child: InkWell(
              onTap: () {
                selectedIndex.value = index;
                customMsg('${sites[index]} 선택');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.isDark ? Colors.teal.shade900 : Colors.teal
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                  child: TextWidget(
                    '#${sites[index]}',
                    14.5,
                    context.width,
                    color: isSelected ? Colors.white : context.subTextColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}