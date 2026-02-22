import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/view_ui/screen/event_select_screen/provider/event_screen_provider.dart';
import '../../../../core/export_package.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/info_row.dart';
import '../../widgets/left_eleveted_button.dart';
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
                SizedBox(height: 15),
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
              Expanded(
                flex: 1,
                child: LeftElevatedButton(
                  text: '전체 삭제',
                  onPressed: () => context.dialog(EventDeleteDialog()),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: CustomElevatedButton(
                  text: '주요 일정 등록',
                  onPressed: (){
                    HapticFeedback.selectionClick();
                    ref.read(eventScreenProvider.notifier).switchScreen(false);
                  },
                  fontSize: 16,
                ),
              ),


            ],
          ),
        )
      ),
    );
  }
}
