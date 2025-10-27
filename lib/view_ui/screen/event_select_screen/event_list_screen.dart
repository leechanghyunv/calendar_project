import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/screen/event_select_screen/provider/event_screen_provider.dart';
import '../../../../core/export_package.dart';
import '../auth_screen/const_widget.dart';

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
              horizontal: 12.0),
          child: Column(
            children: [
              InfoRow(
                title: '주요일정 등록',
                subtitle: '월급날,입사일 등 중요한 일정을 등록해보세요',
                trailing: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_forward_rounded),
                ),
              ),

            ],
          ),
        ),
        floatingActionButton: Container(
          child: FloatingActionButton(
            backgroundColor: context.bTypeChipColor,
              child: Icon(Icons.add,
                color: context.textColor),
              onPressed: (){
              ref.read(eventScreenProvider.notifier).switchScreen(false);
              }

          ),
        ),
      ),
    );
  }
}
