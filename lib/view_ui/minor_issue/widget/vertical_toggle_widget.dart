import 'dart:async';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/repository/view_controll/vertical_toggle_index.dart';

import '../../../repository/time/calendar_time_controll.dart';


class ToggleWidgetVertical extends ConsumerStatefulWidget {
  final void Function(int?)? onToggle;

  const ToggleWidgetVertical({
    super.key,
    this.onToggle,
  });

  @override
  ConsumerState<ToggleWidgetVertical> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends ConsumerState<ToggleWidgetVertical>{
  Timer? _debounceTimer;


  @override
  void dispose() {
    // _controller.dispose();
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
    final currentIndex = ref.watch(toggleIndexProvider);
    final timeManager = ref.watch(timeManagerProvider);
    final month = timeManager.selected.month.toString().padLeft(2, '0');
    final day = timeManager.selected.day.toString().padLeft(2, '0');

    double appWidth = MediaQuery.of(context).size.width;
    double appHight = MediaQuery.of(context).size.height;

    double screenUtilSize(double size) {
      return Platform.isAndroid
          ? appWidth > 500
          ? (size - 1.0).sp / 2
          : (appWidth <= 370
          ? (size - 2.0).sp /// 문제가 되는 지점은 여기다 !!!
          : (size - 1.0).sp)

          : appWidth > 500
          ? size.sp / 2
          : (appWidth <= 370
          ? (size - 1.0).sp
          : size.sp);
    }

    return ToggleSwitch(
      minWidth: appWidth < 500
          ? appHight > 700
          ? 155.w
          : (appWidth <= 370
          ? 150.w
          : 145.w)
          : 80.w,

      minHeight:
      appHight < 700
          ? 22.5
          : appWidth > 500
          ? 30
          : (appWidth <= 370
          ? 22.5
          : 25),

      initialLabelIndex: currentIndex,
      dividerMargin: 4.0,
      dividerColor: Colors.grey.shade500,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.blueGrey.shade100, ///
      inactiveFgColor: Colors.black,
      totalSwitches: 3,
      isVertical: true,
      radiusStyle: true,
      customWidgets: [
        Container(
          child: Text(
            maxLines: 1,
            '근로조건(공수)설정',
            style: TextStyle(
                fontSize: appHight > 700 ? screenUtilSize(14) : screenUtilSize(13),
                fontWeight: Platform.isAndroid? FontWeight.w700 : FontWeight.bold,
                letterSpacing: Platform.isAndroid ? 2.5 : 1.5,
                color: Colors.black,

            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: Text(
            '${month}월 ${day}일 공수등록',
            maxLines: 1,
            style: TextStyle(
                fontSize: appHight > 700
                    ? screenUtilSize(14)
                    : screenUtilSize(13),

                fontWeight: Platform.isAndroid? FontWeight.w700 : FontWeight.bold,
                letterSpacing: Platform.isAndroid ? 1.65 : 0.5,
                color: Colors.black,

            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: Text(
            maxLines: 1,
            '공수기록 삭제 관리',
            style: TextStyle(
                fontSize: appHight > 700 ? screenUtilSize(14) : screenUtilSize(13),
                fontWeight: Platform.isAndroid? FontWeight.w700 : FontWeight.bold,
                letterSpacing: Platform.isAndroid ? 2.5 : 1.5,
                color: Colors.black
            ),
            textAlign: TextAlign.center,
          ),

        ),
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
