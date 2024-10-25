import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:intl/intl.dart';

import '../../core/export.dart';
import '../../core/widget/text_style_util.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/calendar_event_model.dart';
import '../../view_model/contract_model.dart';
import '../../view_model/history_model.dart';
import '../container/memo_container.dart';
import '../minor_issue/default/default_dialog_delete.dart';
import '../minor_issue/widget/delete_button.dart';
import '../minor_issue/widget/qr_container.dart';
import '../update_dialog/erase_animation_button_text.dart';
import 'erase_dialog.dart';
import 'month_delete_dialog.dart';

class DeleteManagerForm extends ConsumerStatefulWidget {
  const DeleteManagerForm({super.key});

  @override
  ConsumerState<DeleteManagerForm> createState() => _DeleteFormState();
}

class _DeleteFormState extends ConsumerState<DeleteManagerForm> {

  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeght = MediaQuery.of(context).size.height;
    final textSize = appWidth > 500? screenUtilSize(8.5) : screenUtilSize(17);
    final state = ref.watch(viewContractProvider);
    final data = ref.watch(viewHistoryProvider);

    final timeManager = ref.watch(timeManagerProvider);
    final selected = timeManager.selected;
    final yearTwoDigits = DateFormat('yy').format(selected); // "24"
    final month = selected.month.toString().padLeft(2, '0');
    final day = selected.day.toString().padLeft(2, '0');

    Future<void> refresh(WidgetRef ref) async {
      Future.delayed(const Duration(milliseconds: 250), () {
        ref.refresh(calendarEventProvider);
        ref.read(timeManagerProvider.notifier).selectedNextDay();
        Navigator.pushReplacementNamed(context, '/main');
      });
    }

    Widget DateTimeRow() => Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextWidget('선택 날짜: ${selected.year}년 ${month}월 ${day}일', 15, appWidth),
        ),
        Spacer(),
      ],
    );

    return DefaultDeleteDialog(
      title: const QrContainer(
        msg: '공수를 삭제해주세요',
        textColor: Colors.black,
      ),
      children: [
        Container(
          width: MediaQuery.of(context).size.width,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateTimeRow(),
              SizedBox(height: 10),
              DeleteButton(
                imoji: '📄',
                title: '${month}월 ${day}일 공수를 삭제합니다',
                onTap: () {
                  data.when(data: (val) async {
                    final selectedOne = val.where((e) => e.date.toUtc() == selected);
                    if(selectedOne.isEmpty){
                      customMsg('${selected.month}월 ${selected.day}일 데이터가 없습니다.');
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
              ),
              DeleteButton(
                  imoji: '🗑️',
                  title: '${yearTwoDigits}년 ${month}월 공수를 삭제합니다',
                onTap: (){
                  data.when(data: (val) async {
                    final selectedOne = val.where((e) =>
                    e.date.month == selected.month && e.date.year == selected.year);
                    if(selectedOne.isEmpty){
                      customMsg('${selected.month}월 데이터가 없습니다.');
                    }else{
                      showDialog(
                        context: context,
                        builder: (context) => const MonthDeleteDialog(),
                      ).then((_){
                        refresh(ref);
                      });
                    }
                  }, error: (err,trace){}, loading: (){});
                },
              ),
              DeleteButton(
                  imoji: '🗄️',
                  title: '모든 공수 기록을 삭제합니다',
                onTap: (){
                  showDialog(
                      context: context, builder: (context) => EraseDialog());
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ErrorText('공수기록 수정은 원하는 날짜에 공수를 다시 등록해주세요', appWidth),
        ),
      ],

      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  appHeght > 700 ? 12.0 : 8.0,
                  0.0,
                  0.0,
                  4.0),
              child: TextButton(
                onPressed: () async {
                  if (await inAppReview.isAvailable()) {
                    inAppReview.requestReview();
                  }
                  // reviewMsg();
                },
                child: EraseButtonText(msg: '앱 평가하기(리뷰,평점)'),
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: TextWidget('취소',
                    textSize,
                    appWidth)),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget('확인',
                  textSize,
                  appWidth),
            ),
          ],
        ),
      ],
    );

  }



}
