import 'package:calendar_project_240727/core/extentions/modal_extension.dart';

import '../../../../core/export_package.dart';
import '../../auth_screen/auth_screen_exSurvey.dart';


void showBasicModal(BuildContext context) {
  context.showModal(
    heightRatio: 0.825,
    child: ExSurveyAuthScreen(),
  );
}



