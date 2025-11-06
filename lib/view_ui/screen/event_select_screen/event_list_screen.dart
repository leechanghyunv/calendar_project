import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/event_select_screen/provider/event_screen_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../core/export_package.dart';
import '../../../view_model/sqlite_model/event_model.dart';
import '../auth_screen/const_widget.dart';
import 'component/event_list.dart';

class EventListScreen extends HookConsumerWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0),
          child: Center(
            child: Column(
              children: [
                InfoRow(
                  title: '${ref.month}월 주요일정',
                  subtitle: '일정 등록시 메인 캘린더에서 확인 가능',
                  trailing: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_forward_rounded),
                  ),
                ),
                Spacer(),
                EventListWidget(),
                Spacer(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              FloatingActionButton(
                  backgroundColor: context.bTypeChipColor,
                  child: Icon(MdiIcons.trashCanOutline,
                      color: context.textColor),
                  onPressed: (){
                    HapticFeedback.selectionClick();
                    ref.read(eventViewModelProvider.notifier).clearAll();

                  }

              ),
              Spacer(),
              FloatingActionButton(
                  backgroundColor: context.bTypeChipColor,
                  child: Icon(Icons.add,
                      color: context.textColor),
                  onPressed: (){
                    HapticFeedback.selectionClick();
                    ref.read(eventScreenProvider.notifier).switchScreen(false);
                  }

              ),
            ],
          ),
        )
      ),
    );
  }
}
