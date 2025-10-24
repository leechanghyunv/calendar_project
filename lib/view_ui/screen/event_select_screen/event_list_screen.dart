import '../../../../core/export_package.dart';
import '../auth_screen/const_widget.dart';

class EventListScreen extends HookConsumerWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final nestedScrollController = useScrollController();
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InfoRow(
                title: '주요일정 등록',
                subtitle: '월급날,입사일 등 중요한 일정을 등록해보세요',
                trailing: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_forward_rounded),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
