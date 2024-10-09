import 'dart:convert';

import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../core/export.dart';
import '../../../core/widget/text_widget.dart';
import '../../../model/work_history_model.dart';
import '../../../repository/calendar_time_controll.dart';
import '../../../view_model/calendar_event_model.dart';
import '../../../view_model/filted_source_model.dart';
import 'back_up_container.dart';
import 'back_up_help_msg.dart';
import 'back_up_textfield.dart';
import 'back_up_title.dart';

class BackUpDialog extends ConsumerStatefulWidget {
  const BackUpDialog({super.key});

  @override
  ConsumerState<BackUpDialog> createState() => _BackUpDialogState();
}

class _BackUpDialogState extends ConsumerState<BackUpDialog> {

  bool isStateEmpty = true;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _backupController = TextEditingController();
  List<WorkHistory>? workHistoryList;

  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();

  @override
  void dispose() {
    _focusNode.dispose();
    _backupController.dispose();
    super.dispose();
  }

  void pasteFromClipboard(String externalData) {
    try {
      List<dynamic> jsonList = jsonDecode(externalData);
      List<WorkHistory> workHistoryList = jsonList
          .map((jsonItem) => WorkHistory.fromJson(jsonItem))
          .toList();
      setState(() => this.workHistoryList = workHistoryList);
    } catch (e) {
      print('데이터 변환 중 오류 발생: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final timeManager = ref.watch(timeManagerProvider);
    final thisYear = timeManager.selected.year;
    final state = ref.watch(numericSourceModelProvider(timeManager.selected));

    return AlertDialog(
      title: backUpTitle(context),
      content: SingleChildScrollView(
        child: SizedBox(
          height: 330,
          width: 50.w,
          child: Column(
            children: [
              TextWidget('''카카오톡,이메일 등 외부에 저장되어 있던 공수 데이터를 붙여넣어주세요. 이후 입력칸 좌측에 아이콘을 눌러 저장 해주세요.''',
                  12.5,
                  appWidth),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Showcase(
                  key: _two,
                  description: '👉 복사한 데이터를 새 디바이스에 붙여넣기 해주세요',
                  descTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  blurValue: 1.5,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.grey.shade300,
                    child: BackUpTextfield(
                      iconKey: _three,
                      controller: _backupController,
                      focusNode: _focusNode,
                      hintText: '공수 데이터를 붙여넣어주세요',
                      onChanged: (val){
                        pasteFromClipboard(val);
                        setState(() => isStateEmpty = val.isEmpty);
                      },
                      iconOnPressed: isStateEmpty
                          ? null
                          : (){
                        ref.read(addAllHistoryProvider(workHistoryList!));
                        customMsg('공수 데이터가 저장되었습니다.\n데이터는 근로조건 입력 후 반영됩니다.');
                        Future.delayed(const Duration(milliseconds: 500) ,(){
                          ref.refresh(calendarEventProvider);
                          ref.read(timeManagerProvider.notifier).selectedNextDay();
                        _backupController.clear();
                        });
                        },

                      iconColor: isStateEmpty
                          ? Colors.grey.shade700
                          : Colors.blue.shade700,
                    ),
                  ),
                ),
              ),
              ErrorText('근로조건을 저장한 후에 공수데이터가 캘린더에 반영됩니다.', appWidth),
              /// /// //////////////////////////////////////////
              const SizedBox(height: 25),
              BackUpContainer(
                  (){
                    state.when(data: (val){
                      final histories = val.history.
                      where((e) => e.date.year == thisYear);
                      String jsonString = jsonEncode(histories.
                      map((e) => e.toJson()).toList());
                      Clipboard.setData(ClipboardData(text: jsonString));
                      customMsg('$thisYear년 공수 데이터가 복사되었습니다.');
                    },
                    error: (err,trace) => {
                    customMsg('공수 데이터가 없습니다.'),
                    },
                    loading: () => {}
                    );
                  },
                    (){
                      state.when(data: (val){
                        final histories = val.history.
                        where((e) => e.date.year == thisYear - 1);
                        String jsonString = jsonEncode(histories.
                        map((e) => e.toJson()).toList());
                        Clipboard.setData(ClipboardData(text: jsonString));
                        customMsg('${thisYear-1}년 공수 데이터가 복사되었습니다.');
                      },
                          error: (err,trace) => {
                            customMsg('공수 데이터가 없습니다.'),
                          },
                          loading: () => {}
                      );
                    },
                    (){
                      state.when(data: (val){
                        final histories = val.history.
                        where((e) => e.date.year == thisYear -2);
                        String jsonString = jsonEncode(histories.
                        map((e) => e.toJson()).toList());
                        Clipboard.setData(ClipboardData(text: jsonString));
                        customMsg('${thisYear-2}년 공수 데이터가 복사되었습니다.');
                      },
                          error: (err,trace) => {
                            customMsg('공수 데이터가 없습니다.'),
                          },
                          loading: () => {}
                      );
                    },
                    _one,
                    _four,
              ),
              const SizedBox(height: 10),
              // HelpMsg(appWidth),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IntroButton(),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: TextWidget('취소',15,appWidth),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
              child: TextWidget('확인',15,appWidth),
            ),
          ],
        ),

      ],
    );
  }

  Widget IntroButton() => Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 4.0),
    child: TextButton(
      onPressed: () {
        ShowCaseWidget.of(context).startShowCase([_one, _two, _three, _four]);
      },
      child: const Text('백업은 어떻게?',
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.grey),
      ),
    ),
  );

}
