import 'package:calendar_project_240727/core/export_package.dart';
import '../calendar/calendar_widget.dart';
import '../main_screen_component/main_box_component/main_box.dart';
import '../main_screen_component/under_box_button_component/main_button.dart';
import 'default_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;

    Widget sizeFrame(Widget widget) =>
        appHeight < 700 ? const SizedBox() : widget;

    return DefaultScreen(
      children: [
        sizeFrame(
          SizedBox(
            height: appWidth < 370 ? 10 : 30,
          ),
        ),
        WorkCalendar()
      ],
      buttom: [
        /// 메인 UI box 위젯
        MainBox(),
        /// 하위에 초이스칩 버튼 위젯
        MainButton(),
      ],
    );
  }
}
