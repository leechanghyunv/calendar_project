import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/data/provider/string_list_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/provider/work_site_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/registration_guide_text.dart';
import '../../../../base_consumer.dart';
import '../component/number_picker_modal.dart';

import '../../../../core/extentions/theme_color.dart';
import '../../../../core/utils/converter.dart';
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

    final isOpen = useState(false);

    final currentIndex = useState(0);

    final sitesAsync = ref.watch(stringListNotifierProvider);

    final siteSwitcher = ref.watch(workSiteSwitchProvider);
    final switchValue = useState(siteSwitcher.valueOrNull ?? false);

    Future<void> handleRegistrationComplete() async {
      FocusScope.of(context).unfocus();
      currentIndex.value = 0;

      await ref.read(stringListNotifierProvider.notifier).add(
        value: firstController.text,
        pay: secondController.text,
        tax: thirdController.text,
        subsidy: fourthController.text,
      );
      customMsg('${firstController.text} 조건 적용');
      await ref.refreshState(context);
      Navigator.pop(context);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        NumberPickerModal(context);
      });
    }

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
                      Expanded(
                        child: TextWidget(
                          '일당 등록이 안되어 있을경우 삭제 후 다시 등록해주세요', 14,
                          color: context.subTextColor,
                        ),
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
                              ? '단가:${formatAmount(site.pay)}\n세율:${site.tax}'
                              : '계약 단가가 포함되어 있지 않습니다 ';
                          customMsg(msg);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6.0,
                            vertical: 12.0,
                          ),
                          child: Row(
                            crossAxisAlignment: .start,
                            children: [
                              TextWidget(
                                '${site.value}',
                                15.0,
                                color: context.textColor,
                              ),
                              SizedBox(width: 7.5),
                              if(site.pay == 0)
                              TextWidget(
                                '재등록 필요',
                                8.0,
                                color: Colors.teal,
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
                isOpen: isOpen,
                onComplete: handleRegistrationComplete,
              ),
              SizedBox(height: 5),
              SiteFieldBar(
                controllers: [firstController, secondController, thirdController,fourthController],
                nodes: [firstNode, secondNode, thirdNode,fourthNode],
                hintTexts: ['현장을 등록해주세요','계약 단가를 입력해주세요','세율 입력','일비 없으면 넘어가기'],
                FieldBarIndex: currentIndex,
                onComplete: handleRegistrationComplete,
              ),
            ],
          ),

        ),
      ),
    );
  }
}
