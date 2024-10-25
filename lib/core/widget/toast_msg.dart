import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../export.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void customMsg(String msg) {
  final context = navigatorKey.currentContext;
  if (context != null) {
    showToastWidget(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          msg,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      context: context,
      animation: StyledToastAnimation.fadeScale,
      reverseAnimation: StyledToastAnimation.scale,
      position: StyledToastPosition.center,
      animDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
  }
}


void enrollMsg(DateTime day, String value){
  final context = navigatorKey.currentContext;
  if (context != null) {
    showToastWidget(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
            '${day.month}월 ${day.day}일 $value 선택\n확인 버튼을 눌러주세요',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      context: context,
      animation: StyledToastAnimation.fadeScale,
      reverseAnimation: StyledToastAnimation.scale,
      position: StyledToastPosition.center,
      animDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
  }
}

void reviewMsg(){
  final context = navigatorKey.currentContext;
  if (context != null) {
    showToastWidget(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          '앱 평가하기(리뷰,평점)\n부탁합니다 제발',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      context: context,
      animation: StyledToastAnimation.fadeScale,
      reverseAnimation: StyledToastAnimation.scale,
      position: StyledToastPosition.top,
      animDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 5),
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
  }
}









