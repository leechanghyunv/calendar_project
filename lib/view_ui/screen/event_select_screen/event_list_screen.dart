import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/event_select_screen/provider/event_screen_provider.dart';
import '../../../../core/export_package.dart';
import '../auth_screen/const_widget.dart';
import 'component/event_delete_dialog.dart';
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

                EventListWidget(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: context.bTypeChipColor,
                    child: TextWidget(
                        '모두삭제', 15.5, context.width,
                        color: context.textColor,
                    ),
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context) => EventDeleteDialog(),
                      );

                    }

                ),
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
