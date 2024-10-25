import 'package:calendar_project_240727/core/export.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/repository/toggle_switch_value.dart';
import 'package:calendar_project_240727/view_model/toggle_model.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../repository/calendar_time_controll.dart';
import '../../../view_model/calendar_event_model.dart';
import '../../../view_model/history_model.dart';
import '../../container/memo_container.dart';
import '../../update_dialog/erase_animation_button_text.dart';

class TotalPay extends ConsumerWidget {

  final GlobalKey modeKey;

  const TotalPay(this.modeKey,  {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.watch(toggleValueProvider);
    final appWidth = MediaQuery.of(context).size.width;
    double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
      child: Container(
        width: 300.0,
        height: 27.5,
        child: Showcase(
          key: modeKey,
          targetPadding: const EdgeInsets.all(5),
          description: '👉"메모기록 보기 설정" 으로 변경시\n      메인화면에 날자별 메모 기록이 보여집니다.',
          descTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          blurValue: 1.5,
          child: ToggleSwitch(
            minWidth: 200.0,
            minHeight: 25,
            cornerRadius: 5.0,
            activeBgColors: [[Colors.grey[600]!], [Colors.grey[600]!]],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.white,
            inactiveFgColor: Colors.black,
            initialLabelIndex: ref.watch(toggleModelProvider).value == false ? 1 : 0,
            totalSwitches: 2,
            labels: const ['메모기록 보기 설정', '공수기록 보기 설정'],
            customTextStyles: [
              TextStyle(fontWeight: FontWeight.bold,
                  fontSize: appWidth > 500? screenUtilSize(6.5) :screenUtilSize(13)),
            ],
            radiusStyle: true,
            onToggle: (index) {
              if(index == 0){
                customMsg('메모모드로 변경되었습니다\n달력상에 메모위주로 보여드립니다.');
                ref.read(toggleModelProvider.notifier).setToggleValue1(); /// true
                Navigator.pushReplacementNamed(context, '/main');
              }else{
                customMsg('공수모드로 변경되었습니다\n달력상에 공수위주로 보여드립니다.');
                ref.read(toggleModelProvider.notifier).setToggleValue2(); /// false
                Navigator.pushReplacementNamed(context, '/main');
              }
            },
          ),
        ),
      ),
    );
  }
}


