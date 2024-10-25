import 'dart:async';
import 'package:calendar_project_240727/core/export.dart';
import 'package:calendar_project_240727/repository/vertical_toggle_index.dart';
import '../../../repository/calendar_time_controll.dart';


class ToggleWidgetVertical extends ConsumerStatefulWidget {
  final void Function(int?)? onToggle;

  const ToggleWidgetVertical({
    super.key,
    this.onToggle,
  });

  @override
  ConsumerState<ToggleWidgetVertical> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends ConsumerState<ToggleWidgetVertical> {
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _handleToggle(int? index) {
    if (index != null) {
      ref.read(toggleIndexProvider.notifier).onToggle(index);
      _debounceTimer?.cancel();     // 2. 이전 타이머 즉시 취소

      _debounceTimer = Timer(Duration(milliseconds: 100), () {  // 3. 100ms 후 실행
        if (mounted) {
          widget.onToggle?.call(index);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final timeManager = ref.watch(timeManagerProvider);
    final month = timeManager.selected.month.toString().padLeft(2, '0');
    final day = timeManager.selected.day.toString().padLeft(2, '0');

    double appWidth = MediaQuery.of(context).size.width;
    double appHight = MediaQuery.of(context).size.height;
    double screenUtilSize(double size) {
      return Platform.isAndroid
          ? appWidth > 500
              ? (size - 1.0).sp / 2
              : (size - 1.0).sp
          : appWidth > 500
              ? size.sp / 2
              : size.sp;
    }

    return ToggleSwitch(
      minWidth: appWidth < 500
          ? appHight > 700 ? 155.w : 145.w
          : 40.w,
      minHeight: 25,
      initialLabelIndex: ref.watch(toggleIndexProvider),
      doubleTapDisable: true,

      // cornerRadius: 20.0,
      dividerMargin: 4.0,
      dividerColor: Colors.grey.shade500,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.blueGrey.shade100,
      inactiveFgColor: Colors.black,

      totalSwitches: 3,
      isVertical: true,
      radiusStyle: true,
      customTextStyles: [
        TextStyle(
            fontSize: appHight > 700 ? screenUtilSize(14) : screenUtilSize(13),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.black),
        TextStyle(
            fontSize: appHight > 700 ? screenUtilSize(14) : screenUtilSize(13),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Colors.black),
        TextStyle(
            fontSize: appHight > 700 ? screenUtilSize(14) : screenUtilSize(13),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.black)
      ],
      labels: [
        '근로조건(공수)설정',
        '${month}월 ${day}일 공수등록',
        '공수기록 삭제 관리'
      ],

      activeBgColors: [
        [Colors.blue.shade500],
        [Colors.blue.shade500],
        [Colors.blue.shade500]
      ],
      onToggle: _handleToggle,
    );
  }
}
