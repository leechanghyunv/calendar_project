import '../../../../core/export_package.dart';
import '../../auth_screen/auth_screen.dart';
import '../../auth_screen/auth_screen_exSurvey.dart';


void showBasicModal(BuildContext context,bool survey) {
  showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    backgroundColor: Colors.black26,
    context: context,
    isDismissible: true,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      final screenHeight = MediaQuery.of(context).size.height;

      return Container(
        height: survey ? Platform.isAndroid ? screenHeight * 0.6 : screenHeight * 0.8:
        Platform.isAndroid ? screenHeight * 0.4 : screenHeight * 0.6,
        /// 안드로이드의 키보드가 더 높기때문에 overflow 에러가 발생 해답은 이렇게 해결
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // 🎯 핸들바를 모달 레벨에서 처리
            Container(
              width: 30,
              height: 4,
              margin: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: survey ? SettingScreen() : ExSurveyAuthScreen(), // 내부에서 핸들바 제거하고 사용
            ),
          ],
        ),
      );
    },
  );
}

