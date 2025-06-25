import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/statistic_switch_provider.dart';


class CustomTrackSwitch extends HookConsumerWidget {
  const CustomTrackSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchAsync = ref.watch(switchNotifierProvider);
    final width = MediaQuery.of(context).size.width;
    final height = width > 750 ? 25.0 : 24.0;
    final isOn = switchAsync.valueOrNull ?? false;

    return SizedBox(
      height: height,
      child: Transform.scale(
        scale: height / (width > 400 ? 21.0 : 24.0), // 기본 스위치 높이가 24이므로 비율 맞춤
        child: Switch(
          value: isOn,
          onChanged: (val) => ref.read(switchNotifierProvider.notifier).setValue(val),

          // ✅ thumb 색상 (ON/OFF)
          thumbColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? Colors.blue.shade300
                : Colors.green.shade300;
          }),

          // ✅ 트랙 색상 (ON/OFF)
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
