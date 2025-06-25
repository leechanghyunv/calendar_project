import 'package:calendar_project_240727/repository/sharePreferences_init.dart';
import 'package:calendar_project_240727/view_ui/screen/user_statistics_screen/component/modal_sheet/auth_modal_component.dart';
import 'core/export_package.dart';
import 'core/widget/text_widget.dart';

class FirstOpenDialog extends ConsumerWidget {
  const FirstOpenDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final pref = ref.watch(sharedPrefsProvider.future);

    Future<void> first_intro(bool check) async {
      final prefs = await pref;
      await prefs.setBool('is_first_time', false);
      check ? showBasicModal(context) : null;
      Navigator.of(context).pop();
    }

    return AlertDialog(
      backgroundColor: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: TextWidget(' 🎉안녕하세요 워크캘린더입니다.',15,appWidth),
      content: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0,horizontal: 4.0,
                ),
                child: TextWidget('워크캘린더는 처음시작할때 근로조건을 설정 하셔야 원활하게 이용하실 수 있습니다. 지금 이동하시겠습니까?',
                    15,appWidth),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async => first_intro(false),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextWidget('나가기', 15,appWidth),
          ),
        ),
        TextButton(
          onPressed: () async => first_intro(true),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextWidget('이동하기', 15,appWidth),
          ),
        ),
      ],
    );
  }





}
