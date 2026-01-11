
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../export_package.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void _showCustomToast(Widget child) {
  final context = navigatorKey.currentContext;
  if (context == null) return;

  showToastWidget(
    Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
        border: context.isDark ? Border.all(color: Colors.white, width: 0.5) : null,
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
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

void customMsg(String msg) {
  _showCustomToast(
      Text(msg,
          textScaler: TextScaler.noScaling,
          style: _defaultToastTextStyle)
  );
}

void enrollMsg(DateTime day, String value) {
  _showCustomToast(
    Text(
      '${day.month}월 ${day.day}일 $value',
      textScaler: TextScaler.noScaling,
      style: _defaultToastTextStyle,
    ),
  );
}

void enrollMsg2(DateTime day, String value) {

  _showCustomToast(
    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${day.day}일 $value(일비포함)',
          textScaler: TextScaler.noScaling,
          style: _defaultToastTextStyle,
        ),

      ],
    ),
  );
}





