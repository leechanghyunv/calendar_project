import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';

import '../../../../core/export_package.dart';
import '../../../view_model/view_provider/display_view_record_model.dart';
import 'component/basic_record_button.dart';
import 'component/dark_light_button.dart';
import 'component/record_expansionTile.dart';
import 'component/setting_button.dart';

class AppSettingScreen extends HookConsumerWidget {
  const AppSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final nestedScrollController = useScrollController();
    final calendarValue = useState(false);
    final isKorean = useState(true);
    final isTest = useState(false);
    final selected = useState(2); // 0: 라이트, 1: 다크, 2: 시스템

    final firstController = useTextEditingController();
    final secondController = useTextEditingController();
    final thirdController = useTextEditingController();

    final firstFocusNode = useFocusNode();
    final secondFocusNode = useFocusNode();
    final thirdFocusNode = useFocusNode();


    Widget dib() =>  Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Divider(
        color: Colors.grey.shade300,
        thickness: 1.0,
      ),
    );


    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Expanded(
                          child: ModeButton(
                            label: '라이트',
                            icon: Icons.light_mode_outlined,
                            isSelected: selected.value == 0,
                            onTap: () {
                              selected.value = 0;
                              customMsg('라이트 모드 선택');
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ModeButton(
                            label: '다크',
                            icon: Icons.dark_mode_outlined,
                            isSelected: selected.value == 1,
                            onTap: (){
                              selected.value = 1;
                              customMsg('다크 모드 선택');
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ModeButton(
                            label: '시스템',
                            icon: Icons.settings_outlined,
                            isSelected: selected.value == 2,
                            onTap: () {
                              selected.value = 2;
                              customMsg('시스템 모드 선택');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // dib(),
                  // ///



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
                    onChanged: (val) => calendarValue.value = val,
                  ),
                  const SizedBox(height: 4),
                  SettingItem(
                    title: '환율 설정',
                    subtitle: '테스트 모델입니다',
                    value: isTest.value,
                    onChanged: (val) => isTest.value = val,
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
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Column(
                          children: [
                            SettingTextField(
                              title: '정상근무',
                              controller: firstController,
                              focusNode: firstFocusNode,
                              onSubmitted: (val){
                                secondFocusNode.requestFocus();
                              },
                            ),
                            SettingTextField(
                              title: '연장근무',
                              controller: secondController,
                              focusNode: secondFocusNode,
                              onSubmitted: (val){
                                thirdFocusNode.requestFocus();
                              },
                            ),
                            SettingTextField(
                              title: '야간근무',
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  dib(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8.0),
                  //   child: Row(
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           TextWidget('중요날짜 설정', 15, context.width),
                  //           const SizedBox(height: 2.5),
                  //           TextWidget('달력상에 중요날짜 표시 & 공수 등록시 색상 변경',
                  //               12, context.width, color: Colors.grey.shade500),
                  //         ],
                  //       ),
                  //       const Spacer(),
                  //       GestureDetector(
                  //         onTap: (){},
                  //         child: Icon(Icons.keyboard_arrow_right,
                  //             color: Colors.grey),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // dib(),


                ],
              ),
            ),
          ),
        ),
      ),
    );



  }





}
