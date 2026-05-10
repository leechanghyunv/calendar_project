import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/data/provider/string_list_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/provider/work_site_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/registration_guide_text.dart';

import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/toast_msg.dart';
import '../../../widgets/info_row.dart';
import '../../../widgets/textField_bar/site_field_bar.dart';
import '/../../core/export_package.dart';

class SiteRegistrationScreen extends HookConsumerWidget {
  const SiteRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final firstController = useTextEditingController();
    final secondController = useTextEditingController();
    final thirdController = useTextEditingController();
    final fourthController = useTextEditingController();

    final firstNode = useFocusNode();
    final secondNode = useFocusNode();
    final thirdNode = useFocusNode();
    final fourthNode = useFocusNode();


    final currentIndex = useState(0);

    final sitesAsync = ref.watch(stringListNotifierProvider);

    final siteSwitcher = ref.watch(workSiteSwitchProvider);
    final switchValue = useState(siteSwitcher.valueOrNull ?? false);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  InfoRow(
                    title: '작업 현장을 등록해주세요',
                    subtitle: '등록란에서 업체명 선택후 공수설정',
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
              Container(
                decoration: BoxDecoration(
                  color: context.isDark ? Colors.black87 : Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 7.5),
                      TextWidget(
                        '일반공수칩 등록시에도 작업 현장이 적용됩니다', 15,
                        color: context.subTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              Expanded(
                child: switch (sitesAsync) {
                  AsyncData(:final value) => value.isEmpty
                      ? Center(
                    child: TextWidget(
                      '등록된 현장이 없습니다', 14.0,
                      color: context.subTextColor,
                    ),
                  ) : ListView.separated(
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
                          final msg = (site.pay != 0 && site.tax != 0.0)
                              ? '${site.value}\n계약단가:${site.pay}\n세율:${site.tax}'
                              : '${site.value} 선택 ';
                          customMsg(msg);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6.0,
                            vertical: 12.0,
                          ),
                          child: Row(
                            children: [
                              TextWidget(
                                site.value, 15.0,
                                color: context.textColor,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  ref.read(stringListNotifierProvider.notifier).delete(site.value);
                                  HapticFeedback.selectionClick();
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
          child: Column(
            mainAxisSize: .min,
            children: [
              RegistrationGuideText(
                controllers: [firstController, secondController, thirdController,fourthController],
                guideIndex: currentIndex,
              ),
              SizedBox(height: 5),
              SiteFieldBar(
                controllers: [firstController, secondController, thirdController,fourthController],
                nodes: [firstNode, secondNode, thirdNode,fourthNode],
                hintTexts: ['현장을 등록해주세요','계약 단가를 입력해주세요','세율 입력','일비 없으면 넘어가기'],
                FieldBarIndex: currentIndex,
              ),
            ],
          ),

        ),
      ),
    );
  }
}
