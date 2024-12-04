import 'package:calendar_project_240727/core/widget/toast_loading_animation.dart';

import '../export_package.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void _showCustomToast(Widget child) {
  final context = navigatorKey.currentContext;
  if (context == null) return;

  showToastWidget(
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    ),
    context: context,
    animation: StyledToastAnimation.fadeScale,
    reverseAnimation: StyledToastAnimation.scale,
    position: StyledToastPosition.center,
    animDuration: const Duration(milliseconds: 300),
    duration: const Duration(seconds: 2),
    curve: Curves.easeInOut,
    reverseCurve: Curves.easeInOut,
  );
}

const TextStyle _defaultToastTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

void customMsg(String msg) {
  _showCustomToast(
      Text(msg, style: _defaultToastTextStyle)
  );
}

void enrollMsg(DateTime day, String value) {
  _showCustomToast(
    Text(
      '${day.month}월 ${day.day}일 $value 선택\n확인 버튼을 눌러주세요',
      style: _defaultToastTextStyle,
    ),
  );
}

void showLoadingMsg() {
  _showCustomToast(
      const AnimatedLoadingText()
  );
}

/// L😀ading......
/// L🔅ading......
/// L🎃ading......
/// L⚙️ading......






