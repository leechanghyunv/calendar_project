
import 'package:calendar_project_240727/core/extentions/modal_extension.dart';
import '../../../../../core/export_package.dart';
import 'back_up_modal_screen.dart';

void showBackUpModal(BuildContext context) {
  context.showModal(
    heightRatio: 0.6,
    child: BackUpModalScreen(),
  );
}