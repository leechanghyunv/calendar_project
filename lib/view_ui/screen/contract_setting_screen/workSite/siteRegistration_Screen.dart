import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/data/provider/string_list_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/component/auth_textField/auth_field_decoration.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/workSite_textfield.dart';

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

    final siteNode = useFocusNode();
    final siteEditingController = useTextEditingController();
    final sitesAsync = ref.watch(stringListNotifierProvider);
    final sites = ['세보MEC', '유창', '파라텍', '세안'];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              SizedBox(height: 5),
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
                  child: WorksiteTextField(
                    focusNode: siteNode,
                    textController: siteEditingController,
                    onSubmitted: (val){
                      siteNode.requestFocus();
                    },
                  )
              ),
              SizedBox(height: 20),
              Expanded(
                child: switch (sitesAsync) {
                  AsyncData(:final value) => ListView.separated(
                    itemCount: value.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      thickness: 0.5,
                      color: context.isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                    ),
                    itemBuilder: (context, index) {
                      final site = value[index];
                      return InkWell(
                        onTap: () {
                          customMsg('${site.value} 선택');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6.0,
                            vertical: 12.0,
                          ),
                          child: Row(
                            children: [
                              TextWidget(
                                site.value,
                                15.0,
                                context.width,
                                color: context.textColor,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  ref.read(stringListNotifierProvider.notifier).delete(site.value);
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
                  AsyncError(:final error) => Center(child: Text(error.toString())),
                  _ => Center(
                    child: Text('loading.....'),
                  ),
                },
              ),
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
                    ref.read(stringListNotifierProvider.notifier).add(siteEditingController.text);
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
