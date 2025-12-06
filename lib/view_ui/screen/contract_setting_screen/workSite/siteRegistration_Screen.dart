import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/component/auth_textField/auth_field_decoration.dart';

import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/toast_msg.dart';
import '../../../widgets/elevated_button.dart';
import '../../auth_screen/const_widget.dart';
import '../component/number_picker_modal.dart';
import '/../../core/export_package.dart';

class SiteRegistrationScreen extends HookConsumerWidget {
  const SiteRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final sites = ['세보MEC', '유창', '파라텍', '세안'];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  InfoRow(
                    title: '작업 현장을 등록해주세요',
                    subtitle: '일당을 입력하면 자동으로 일당을 수정합니다',
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(Icons.clear,
                          color: context.isDark ? Colors.white : Colors.grey.shade700,
                          size: 25),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              authContainer(
                  child: SizedBox()
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: sites.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    thickness: 0.5,
                    color: context.isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        customMsg('${sites[index]} 선택');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6.0,
                          vertical: 12.0,
                        ),
                        child: Row(
                          children: [
                            TextWidget(
                              sites[index],
                              15.0,
                              context.width,
                              color: context.textColor,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                customMsg('${sites[index]} 삭제');
                              },
                              icon: Icon(
                                Icons.remove,
                                color: context.subTextColor,
                                size: 20,
                              ),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
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
                  onPressed: () {
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
