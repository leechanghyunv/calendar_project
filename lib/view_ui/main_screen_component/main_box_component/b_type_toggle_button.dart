import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/b_type_switch_provider.dart';

import '../../../core/export_package.dart';

class SwitchExample extends HookConsumerWidget {
  const SwitchExample({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final switchAsync = ref.watch(bTypeSwitchProviderProvider);
    final isOn = switchAsync.valueOrNull ?? false;
    final width = MediaQuery.of(context).size.width;
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
                ? Colors.blue.shade300
                : Colors.green.shade300;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.blue.shade100; // ON 상태
            }
            return Colors.green.shade100; // OFF 상태
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