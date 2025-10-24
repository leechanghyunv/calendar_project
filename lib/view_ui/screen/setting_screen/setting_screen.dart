import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/setting_screen/provider/animation_provider.dart';
import '../../../../core/export_package.dart';
import '../../../core/dark_light/dark_light.dart';
import '../../../view_model/sqlite_model/contract_model.dart';
import '../../../view_model/view_provider/calendar_switcher_model.dart';
import '../../../view_model/view_provider/display_view_record_model.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/left_eleveted_button.dart';
import '../auth_screen/const_widget.dart';
import '../auth_screen/provider/condition_list_provider.dart';
import 'component/basic_record_button.dart';
import 'component/dark_light_button.dart';
import 'component/dayPay_numberField.dart';
import 'component/record_expansionTile.dart';
import 'component/setting_button.dart';

class AppSettingScreen extends HookConsumerWidget {
  const AppSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final nestedScrollController = useScrollController();

    final calendarSwitcher = ref.watch(calendarSwitcherProvider);

    final calendarValue = useState(calendarSwitcher.valueOrNull ?? false);

    final isKorean = useState(true);

    final openingAnimation = ref.watch(openingAnimationProvider);

    final isAnimated = useState(openingAnimation.valueOrNull ?? false);

    final themeMode = ref.watch(lightDarkModeProvider);
    final themeNotifier = ref.read(lightDarkModeProvider.notifier);

    final selectedIndex = switch (themeMode) {
      ThemeMode.light => 0,
      ThemeMode.dark => 1,
      ThemeMode.system => 2,
    };

    final firstController = useTextEditingController();
    final secondController = useTextEditingController();
    final thirdController = useTextEditingController();
    final dayPayController = useTextEditingController();

    final firstFocusNode = useFocusNode();
    final secondFocusNode = useFocusNode();
    final thirdFocusNode = useFocusNode();
    final dayPayFocusNode = useFocusNode();

    ref.contractForm;

    final formzRefNot = ref.formzWatch;
    final formzRefRead = ref.formzRead;

    ref.watch(viewContractProvider);

    Widget dib() =>  Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Divider(
        color: Colors.grey.shade300,
        thickness: 1.0,
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: NestedScrollView(
          controller: nestedScrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [];
            },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0,horizontal: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Expanded(
                          child: ModeButton(
                            label: '라이트',
                            icon: Icons.light_mode_outlined,
                            isSelected: selectedIndex == 0,
                            onTap: () async {
                              await themeNotifier.setTheme(ThemeMode.light);
                              Navigator.pop(context);
                              customMsg('라이트 모드 선택');
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ModeButton(
                            label: '다크',
                            icon: Icons.dark_mode_outlined,
                            isSelected: selectedIndex == 1,
                            onTap: () async {
                              await themeNotifier.setTheme(ThemeMode.dark);
                              Navigator.pop(context);
                              customMsg('다크 모드 선택');
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ModeButton(
                            label: '시스템',
                            icon: Icons.settings_outlined,
                            isSelected: selectedIndex == 2,
                            onTap: () async {
                              await themeNotifier.setTheme(ThemeMode.system);
                              Navigator.pop(context);
                              customMsg('시스템 모드 선택');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                  SettingItem(
                    title: '언어 설정',
                    subtitle: isKorean.value ? '한국어 사용' : 'English',
                    value: isKorean.value,
                    onChanged: (val) => isKorean.value = val,
                  ),
                  const SizedBox(height: 4),
                  SettingItem(
                    title: '캘린더 설정',
                    subtitle: calendarValue.value ? '퇴직공제금 & 실업급여 위주' : '공수 & 금액 & 메모 위주',
                    value: calendarValue.value,
                    onChanged: (val) {
                      ref.read(calendarSwitcherProvider.notifier).toggle();
                      calendarValue.value = val;
                    },
                  ),
                  const SizedBox(height: 4),
                  SettingItem(
                    title: '오프닝 애니메이션',
                    subtitle: isAnimated.value ? '오프닝 애니메이션 유지' : '오프닝 애니메이션 중단',
                    value: isAnimated.value,
                    onChanged: (val){
                      ref.read(openingAnimationProvider.notifier).AnimationToggle();
                      isAnimated.value = val;
                    }
                  ),

                  dib(),
                  CustomExpansionTile(
                    title: '기본공수변경',
                    subtitle: '메인 화면에서 사용되는 공수 버튼 변경',
                    onTap: (){
                      firstFocusNode.requestFocus();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SettingTextField(
                                  title: '정상근무',
                                  hintText: '1.0공수',
                                  controller: firstController,
                                  focusNode: firstFocusNode,
                                  onSubmitted: (val){
                                    secondFocusNode.requestFocus();
                                  },
                                ),
                                Spacer(),
                                SettingTextField(
                                  title: '연장근무',
                                  hintText: '1.5공수',
                                  controller: secondController,
                                  focusNode: secondFocusNode,
                                  onSubmitted: (val){
                                    thirdFocusNode.requestFocus();
                                  },
                                ),
                                Spacer(),
                                SettingTextField(
                                  title: '야간근무',
                                  hintText: '2.0공수',
                                  controller: thirdController,
                                  focusNode: thirdFocusNode,
                                  onSubmitted: (val){
                                    final normal = double.tryParse(firstController.text) ?? 1.0;
                                    final extended = double.tryParse(secondController.text) ?? 1.5;
                                    final night = double.tryParse(thirdController.text) ?? 2.0;
                                    ref.read(displayValueProvider.notifier).copyWithState(normal, extended, night);
                                    ref.invalidate(displayValueProvider);
                                    customMsg('리스트에 반영되었습니다');
                                    Navigator.pop(context);
                                  },
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: LeftElevatedButton(
                                    text: '초기화',
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 4,
                                  child: CustomElevatedButton(
                                    text: '모두 입력했습니다!',
                                    onPressed: () {
                                      if (firstFocusNode.hasFocus) {
                                        secondFocusNode.requestFocus();
                                      } else if (secondFocusNode.hasFocus) {
                                        thirdFocusNode.requestFocus();
                                      } else if (thirdFocusNode.hasFocus) {
                                        FocusScope.of(context).unfocus(); // 모든 포커스 해제
                                        final normal = double.tryParse(firstController.text) ?? 1.0;
                                        final extended = double.tryParse(secondController.text) ?? 1.5;
                                        final night = double.tryParse(thirdController.text) ?? 2.0;
                                        ref.read(displayValueProvider.notifier).copyWithState(normal, extended, night);
                                        ref.invalidate(displayValueProvider);
                                        customMsg('리스트에 반영되었습니다');
                                        Navigator.pop(context);
                                      }
                                    },

                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  dib(),
                  CustomExpansionTile(
                    title: '일비 설정하기',
                    subtitle: '업체에서 지급하는 교통비 & 식대',
                    onTap: (){},
                    child: Column(
                      children: [
                        NumberField(
                          controller: dayPayController,
                          focusNode: dayPayFocusNode,
                          hintText: '10,000',
                          onChanged: (val){
                            if (val == null || val.isEmpty) {
                              return;
                            }
                            final cleanedValue = dayPayController.text.replaceAll(',', '');
                            formzRefRead.onChangeSubsidy(cleanedValue);
                          },
                          onSubmitted: (val){
                            ref.read(conditionListProvider.notifier).updateCondition(3, val);
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        ValidationText(text: formzRefNot.subsidyError),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: LeftElevatedButton(
                                text: '초기화',
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 4,
                              child: CustomElevatedButton(
                                text: '입력했습니다!',
                                onPressed: () {
                                  final cleanedValue = dayPayController.text.replaceAll(',', '');
                                  final value = int.tryParse(cleanedValue);
                                  if (value != null) {
                                    ref.read(updateSubsidyProvider(value));
                                    ref.refreshState(context);
                                  }
                                  customMsg('목표금액이 변경되었습니다.');
                                  Navigator.pop(context);
                                },

                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  dib(),
                  // Expanded(child: Container()),

                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: LeftElevatedButton(
                          text: '초기화',
                          onPressed: (){

                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: CustomElevatedButton(
                          text: '입력했습니다!',
                          onPressed: () {
                            },

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );


  }
}
