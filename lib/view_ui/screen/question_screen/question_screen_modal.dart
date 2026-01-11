import 'package:calendar_project_240727/core/extentions/modal_extension.dart';
import 'package:calendar_project_240727/view_ui/screen/question_screen/question_screen.dart';

import '../../../../core/export_package.dart';


void questionModal(BuildContext context){
  context.showModal(
    heightRatio: 0.8,
    child: QuestionScreen(),
  );
}