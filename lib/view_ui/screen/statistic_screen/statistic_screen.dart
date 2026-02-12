import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/provider/statistic_switch_provider.dart';
import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../view_model/view_provider/focus_node_listner.dart';
import '../../dialog/backup_dialog/back_up_dialog.dart';
import '../../dialog/delete_goal_dialog/all_delete_dialog.dart';
import '../../dialog/delete_goal_dialog/goal_setting_dialog.dart';
import '../../widgets/info_row.dart';
import '../range_history_screen/component/range_history_modal_component.dart';
import 'component/filter_chip.dart';
import 'component/function_chip.dart';
import 'component/goal_record_box.dart';
import 'component/history_box_component/selected_history_box/selected_listView.dart';
import 'component/info_box.dart';
import 'component/ui_switch.dart';

class StatisticScreen extends HookConsumerWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = context.height;
    final double width = context.width;
    final switchAsync = ref.watch(switchNotifierProvider);
    final isOn = switchAsync.valueOrNull ?? false;
    final isFocused = ref.watch(focusStateProvider);
    final nestedScrollController = useScrollController();
    final isScrolledDown = useState(false);


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: NestedScrollView(
            controller: nestedScrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [


                              InfoRow(
                                title: '누적기록관리',
                                subtitle: '등록된 공수를 기반으로 통계를 보여드립니다.',
                                trailing: GestureDetector(
                                  onTap: () => showRangeModal(context,ref),
                                  child: Icon(Icons.search),
                                ),
                              ),

                              SizedBox(height: height > 750 ? 10.0 : 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FunctionChip(
                                    label: '목표관리',
                                    color: context.chipColor,
                                    borderColor: Colors.grey.shade600,
                                    textColor: context.chipTextColor,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => GoalSettingDialog(),
                                      );
                                    },

                                  ),
                                  SizedBox(width: 10.0),
                                  FunctionChip(
                                    label: '전체삭제',
                                    color: context.chipColor,
                                    borderColor: Colors.grey.shade600,
                                    textColor: context.chipTextColor,
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AllDeleteDialog());
                                    },
                                  ),
                                  SizedBox(width: 5.0),
                                  CustomTrackSwitch(),
                                  Spacer(),

                                  FunctionChip(
                                    label: '공수기록백업',
                                    color: context.chipColor,
                                    borderColor: Colors.grey.shade600,
                                    textColor: context.chipTextColor,
                                    onTap: () {
                                      // showBackUpModal(context);
                                      showDialog(
                                          context: context,
                                          builder: (context) => BackUpDialog());
                                    },
                                  ),


                                ],
                              ),

                              SizedBox(height: height > 750 ? 15.0 : width < 350 ? 10.0 : 20.0),
                              InfoBoxProviderWidget(),
                              SizedBox(height: height > 750 ? 20.0 : 15.0),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height > 750 ? 0 : 10.0),
                    GoalAnimatedSwitcher(),
                    Row(
                      children: [
                        FilterHistoryChip(),
                        Spacer(),
                        FunctionChip(
                          label: isScrolledDown.value ? '@돌아가기' : '@상세히',
                          color: context.idChipColor,
                          borderColor: context.idChipBorderColor,
                          textColor: context.idChipTextColor,
                          onTap: () {

                            if (isScrolledDown.value) {
                              // 원래 위치로 복귀
                              nestedScrollController.animateTo(
                                0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                              isScrolledDown.value = false;
                            } else {
                              // 헤더를 위로 올려서 body만 보이게 스크롤
                              nestedScrollController.animateTo(
                                nestedScrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                              isScrolledDown.value = true;
                            }


                          },
                        ),
                
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        vertical: height > 750 ? 3.0 : 0.0,
                        horizontal: 8.0),
                      child: Divider(
                          color: Colors.grey.shade300, thickness: 1.0),
                    ),
                    Container(

                      child: SelectedListview(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ),
          ),
        );
  }
}
