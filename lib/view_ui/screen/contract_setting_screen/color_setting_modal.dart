import 'package:calendar_project_240727/core/widget/toast_msg.dart';

import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import 'provider/selected_color_provider.dart';

class ColorSettingScreen extends ConsumerWidget {
  const ColorSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColorAsync = ref.watch(selectedColorProvider);
    final selectedColor = selectedColorAsync.valueOrNull ?? Colors.grey.shade200;

    return Container(
      width: 50,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        color: context.isDark ? null : selectedColor,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Color>(
          value: selectedColor,
          isExpanded: true,
          isDense: true,
          padding: EdgeInsets.zero,
          icon: const SizedBox.shrink(),
          selectedItemBuilder: (BuildContext context) {
            return calendarColors.map<Widget>((Color color) {
              return const SizedBox.shrink();
            }).toList();
          },
          items: calendarColors.map<DropdownMenuItem<Color>>((Color color) {
            return DropdownMenuItem<Color>(
              value: color,
              child: Center(
                child: Container(
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: selectedColor,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (Color? newColor) {
            if (newColor != null) {
              ref.read(selectedColorProvider.notifier).setColor(newColor);
              customMsg('색상변경');
            }
          },
          dropdownColor: context.isDark ? Colors.grey.shade900 : Colors.white,
          borderRadius: BorderRadius.circular(7.5),
        ),
      ),
    );
  }
}
