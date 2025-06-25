import '../../../../../core/export_package.dart';
import '../../../auth_screen/auth_screen.dart';


void showBasicModal(BuildContext context) {
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
        height: screenHeight * 0.8,
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
              child: SettingScreen(), // 내부에서 핸들바 제거하고 사용
            ),
          ],
        ),
      );
    },
  );
}

