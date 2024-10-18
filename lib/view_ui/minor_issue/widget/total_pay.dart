import 'package:calendar_project_240727/core/export.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/repository/toggle_switch_value.dart';
import 'package:calendar_project_240727/view_model/toggle_model.dart';
import '../../../repository/calendar_time_controll.dart';
import '../../../view_model/calendar_event_model.dart';
import '../../../view_model/history_model.dart';
import '../../container/memo_container.dart';

class TotalPay extends ConsumerWidget {
  const TotalPay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.watch(toggleValueProvider);
    final timeManager = ref.watch(timeManagerProvider);
    final selected = timeManager.selected;
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;
    final data = ref.watch(viewHistoryProvider);

    double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;
    double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;

    Future<void> refresh(WidgetRef ref) async {
      Future.delayed(const Duration(milliseconds: 250), () {
        ref.refresh(calendarEventProvider);
        ref.read(timeManagerProvider.notifier).selectedNextDay();
        Navigator.pushReplacementNamed(context, '/main');
      });
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
      child: GestureDetector(
        onTap: () async {
          data.when(data: (val) async {
            final selectedOne = val.where((e) => e.date.toUtc() == selected);
            if(selectedOne.isEmpty){
              customMsg('해당 날짜에 데이터가 없습니다.');
            }else{
              showDialog(
                context: context,
                builder: (context) => const MemoDisplayContainer(),
              ).then((_){
                refresh(ref);
              });
            }
          }, error: (err,trace){}, loading: (){});


        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ' ${selected.month}월 ${selected.day}일 데이터 삭제',
              style: TextStyle(
                fontSize: appWidth > 500? screenUtilSize(7) : screenUtilSize(14),
                letterSpacing: 0.5,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),

         ToggleSwitch(
                minWidth: 40.0,
                minHeight: 25,
                cornerRadius: 5.0,
                activeBgColors: [[Colors.grey[600]!], [Colors.grey[600]!]],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.black,
                initialLabelIndex: ref.watch(toggleModelProvider).value == false ? 1 : 0,
                totalSwitches: 2,
                labels: const ['M', 'R'],
                customTextStyles: [
                  TextStyle(fontWeight: FontWeight.bold,
                      fontSize: appWidth > 500? screenUtilSize(6.75) :screenUtilSize(13.5)),
                ],
                radiusStyle: true,
                onToggle: (index) {
                  if(index == 0){
                    customMsg('메모모드로 변경되었습니다\n달력상에 메모위주로 보여드립니다.');
                    ref.read(toggleModelProvider.notifier).setToggleValue1(); /// true
                    Navigator.pushReplacementNamed(
                        context, '/main');

                  }else{
                    customMsg('공수모드로 변경되었습니다\n달력상에 공수위주로 보여드립니다.');
                    ref.read(toggleModelProvider.notifier).setToggleValue2(); /// false
                    Navigator.pushReplacementNamed(
                        context, '/main');
                  }
                },
              ),

          ],
        ),
      ),
    );
  }
}
