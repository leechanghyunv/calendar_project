
import '../../../../../core/export_package.dart';
import 'back_up_modal_screen.dart';

void showBackUpModal(BuildContext context) {
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
        alignment: Alignment.topCenter,
        height: screenHeight * 0.6,
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
              child: BackUpModalScreen(),
            ),
          ],
        ),
      );
    },
  );
}