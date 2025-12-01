import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/component/auth_textField/auth_field_decoration.dart';

import '../../../../core/extentions/theme_color.dart';
import '../../../widgets/elevated_button.dart';
import '../../auth_screen/const_widget.dart';
import '../component/number_picker_modal.dart';
import '/../../core/export_package.dart';

class SiteRegistrationScreen extends HookConsumerWidget {
  const SiteRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final color = context.isDark ? Colors.white : Colors.grey.shade800;
    final bgColor = context.isDark ? Colors.black87 : Colors.grey.shade200;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  InfoRow(
                    title: '작업 현장을 등록해주세요',
                    subtitle: '일당을 입력하면 자동으로 일당을 수정합니다',

                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: bgColor,

                    child: IconButton(
                      onPressed: () {

                      },
                      icon: Icon(
                          Icons.clear,
                          color: color),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              authContainer(child: SizedBox()),
              SizedBox(height: 10),
              Row(
                children: [
                  TextWidget('✅ 작업현장이지만 업체명을 등록하셔도 무관합니다', 11.5, context.width,
                  ),
                ],
              ),
              Row(
                children: [
                  TextWidget('✅ 등록된 현장 별로 공수기록 필터링 기능을 제공합니다', 11.5, context.width),
                ],
              ),
              SizedBox(height: 10),

              /// listTile



            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  text: '등록완료',
                  onPressed: (){
                    HapticFeedback.selectionClick();
                    Navigator.pop(context);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      NumberPickerModal(context);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
