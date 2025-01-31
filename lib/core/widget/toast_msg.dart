
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

 TextStyle _defaultToastTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 17.sp,
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
      '${day.month}월 ${day.day}일 $value',
      style: _defaultToastTextStyle,
    ),
  );
}





