import 'package:calendar_project_240727/view_ui/screen/statistic_screen/provider/statistic_switch_provider.dart';
import '../../../core/export_package.dart';
import '../../../view_model/view_provider/focus_node_listner.dart';
import '../../dialog/backup_dialog/back_up_dialog.dart';
import '../../dialog/delete_goal_dialog/all_delete_dialog.dart';
import '../../dialog/delete_goal_dialog/goal_setting_dialog.dart';
import '../auth_screen/const_widget.dart';
import 'component/data_range_dialog/data_dialog.dart';
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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final switchAsync = ref.watch(switchNotifierProvider);
    final isOn = switchAsync.valueOrNull ?? false;
    final isFocused = ref.watch(focusStateProvider);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey.shade50,
        body: Center(
          child: NestedScrollView(
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
                              height > 750 ?
                              InfoRow(
                                title: '누적기록관리',
                                subtitle: '등록된 공수를 기반으로 통계를 보여드립니다.',
                              ) : SizedBox.shrink(),

                              SizedBox(height: height > 750 ? 10.0 : 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FunctionChip(
                                    label: '목표관리',
                                    color: Colors.grey.shade200,
                                    borderColor: Colors.grey.shade600,
                                    textColor: Colors.grey.shade900,
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
                                    color: Colors.grey.shade200,
                                    borderColor: Colors.grey.shade600,
                                    textColor: Colors.grey.shade900,
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
                                    color: Colors.grey.shade200,
                                    borderColor: Colors.grey.shade600,
                                    textColor: Colors.grey.shade900,
                                    onTap: () {
                                      // showBackUpModal(context);
                                      showDialog(
                                          context: context,
                                          builder: (context) => BackUpDialog());
                                    },
                                  ),
                                ],
                              ),

                              SizedBox(height: height > 750 ? 15.0 : 20.0),
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
                          label: '@검색',
                          color: isOn ? Colors.blue.shade100 : Colors.green.shade100,
                          borderColor: isOn ? Colors.blue.shade400 : Colors.green.shade400,
                          textColor: isOn ? Colors.blue.shade900 : Colors.green.shade900,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => DataDialog(),
                            );
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
                      constraints: BoxConstraints(
                      ),
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
