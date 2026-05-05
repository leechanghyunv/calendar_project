import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/app_setting_screen/payment_cycle_confing/payment_cycle_modal.dart';
import 'package:calendar_project_240727/view_ui/screen/app_setting_screen/provider/animation_provider.dart';
import '../../../../core/export_package.dart';
import '../../../core/dark_light/dark_light.dart';
import '../../../view_model/view_provider/calendar_switcher_model.dart';
import '../event_select_screen/event_screen_modal.dart';
import '../question_screen/question_screen_modal.dart';
import '../range_history_screen/component/range_history_modal_component.dart';
import 'chip_number_config/chip_number_modal.dart';
import 'component/dark_light_button.dart';
import 'component/setting_button.dart';
import 'component/setting_language_switch.dart';

class AppSettingScreen extends HookConsumerWidget {
  const AppSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final nestedScrollController = useScrollController();

    final calendarSwitcher = ref.watch(calendarSwitcherProvider);

    final calendarValue = useState(calendarSwitcher.valueOrNull ?? false);

    final openingAnimation = ref.watch(openingAnimationProvider);

    final isAnimated = useState(openingAnimation.valueOrNull ?? false);

    final themeMode = ref.watch(lightDarkModeProvider);
    final themeNotifier = ref.read(lightDarkModeProvider.notifier);

    final selectedIndex = switch (themeMode) {
      ThemeMode.light => 0,
      ThemeMode.dark => 1,
      ThemeMode.system => 2,
    };

    void _popAndShow(BuildContext context, VoidCallback fn) {
      Navigator.pop(context);
      WidgetsBinding.instance.addPostFrameCallback((_) => fn());
    }

    Widget dib() =>  Padding(
      padding: EdgeInsets.symmetric(vertical: context.width <= 375 ? 0.0 : 4.0),
      child: Divider(
        color: Colors.grey.shade300,
        thickness: 1.0,
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: NestedScrollView(
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
                  SizedBox(height: 30),
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

                  if (context.width > 400)
                    SizedBox(height: 12),

                  // SettingLanguageSwitch(),
      
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
                  SettingTile(
                    title: '기본공수 변경',
                    onTap: () => _popAndShow(context, () => ChipNumberModal(context)),
                  ),

                  dib(),
                  SettingTile(
                    title: '정산주기 설정',
                    onTap: () => _popAndShow(context, () => PaymentCycleModal(context)),
                  ),

                  dib(),
                  SettingTile(
                    title: '주요일정 관리',
                    onTap: () => _popAndShow(context, () => eventListModal(context)),
                  ),

                  dib(),
                  SettingTile(
                    title: '근로기간 검색',
                    onTap: () => _popAndShow(context, () => showRangeModal(context,ref)),
                  ),

                  dib(),
                  SettingTile(
                    title: '자주 묻는 질문',
                    onTap: () => _popAndShow(context, () => questionModal(context)),
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
    );

  }

}

