import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/b_type_switch_provider.dart';

import '../../../core/export_package.dart';

class SwitchExample extends HookConsumerWidget {
  const SwitchExample({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final switchAsync = ref.watch(bTypeSwitchProviderProvider);
    final isOn = switchAsync.valueOrNull ?? false;
    final width = context.width;
    final height = width > 750 ? 25.0 : 24.0;

    return SizedBox(
      height: height,
      child: Transform.scale(
        scale: height / (width > 400 ? 21.0 : 24.0), // 기본 스위치 높이가 24이므로 비율 맞춤
        child: Switch(
          value: isOn,
          onChanged: (bool val) => ref.read(bTypeSwitchProviderProvider.notifier).setValue(val),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? context.toggleOnColor
                : context.toggleOnColor;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return context.toggleTrackOnColor; // ON 상태
            }
            return context.toggleTrackOnColor; // OFF 상태
          }),
          // ✅ 트랙 외곽선 색상
          trackOutlineColor: WidgetStateProperty.all(Colors.black26),
          // ✅ 트랙 외곽선 굵기
          trackOutlineWidth: WidgetStateProperty.all(0.5),
        ),
      ),
    );
  }
}