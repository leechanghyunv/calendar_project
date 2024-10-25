import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_model/contract_model.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';

import '../../../core/export.dart';
import '../../../core/widget/text_widget.dart';
import '../../../model/work_history_model.dart';
import '../../../repository/calendar_time_controll.dart';
import '../../../view_model/calendar_event_model.dart';
import '../../../view_model/filted_source_model.dart';
import 'back_up_dropdown_box.dart';
import 'back_up_textfield.dart';
import 'back_up_title.dart';
import 'drop_down_value.dart';

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
    var thisYear = timeManager.selected.year;
    final state = ref.watch(numericSourceModelProvider(timeManager.selected));
    final dropDownValue = ref.watch(dropDownValueProvider);

    return AlertDialog(
      title: backUpTitle(context),
      content: SingleChildScrollView(
        child: SizedBox(
          height: 310,
          width: 50.w,
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                children: [
                  TextSpan(
                    text: '카카오톡,이메일 등 외부에 저장되어 있던 공수 데이터를 붙여넣어주세요. 이후',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: Platform.isAndroid
                          ? appWidth > 500 ? (12.5 - 1.0).sp/2 : (12.5 - 1.0).sp
                          : appWidth > 500 ? 12.5.sp/2 : 12.5.sp,
                    ),
                  ),
                  TextSpan(
                    text: ' 입력칸 좌측에 아이콘을 눌러 저장 ',
                    style: TextStyle(
                      backgroundColor: Colors.blue.withOpacity(0.3),
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: Platform.isAndroid
                          ? appWidth > 500 ? (12.5 - 1.0).sp/2 : (12.5 - 1.0).sp
                          : appWidth > 500 ? 12.5.sp/2 : 12.5.sp,
                    ),
                  ),
                  TextSpan(
                    text: '해주세요. 아래쪽에 ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: Platform.isAndroid
                          ? appWidth > 500 ? (12.5 - 1.0).sp/2 : (12.5 - 1.0).sp
                          : appWidth > 500 ? 12.5.sp/2 : 12.5.sp,
                    ),
                  ),
                  TextSpan(
                    text: '"백업은 어떻게?"',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: Platform.isAndroid
                          ? appWidth > 500 ? (12.5 - 1.0).sp/2 : (12.5 - 1.0).sp
                          : appWidth > 500 ? 12.5.sp/2 : 12.5.sp,
                    ),
                  ),
                  TextSpan(
                    text: ' 참고',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: Platform.isAndroid
                          ? appWidth > 500 ? (12.5 - 1.0).sp/2 : (12.5 - 1.0).sp
                          : appWidth > 500 ? 12.5.sp/2 : 12.5.sp,
                    ),
                  ),
                ],

              ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Showcase(
                  key: _three,
                  targetPadding: const EdgeInsets.all(5),
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
                      iconKey: _four,
                      controller: _backupController,
                      focusNode: _focusNode,
                      hintText: '공수 데이터를 붙여넣어주세요',
                      onChanged: (val){
                        pasteFromClipboard(val);
                        setState(() => isStateEmpty = val.isEmpty);
                      },
                      iconOnPressed: isStateEmpty
                          ? null
                          : () async {
                        state.when(data: (val) async {
                          if(val.contract.isNotEmpty){
                            if(workHistoryList != null){
                              ref.read(addAllHistoryProvider(workHistoryList!));
                              customMsg('공수 데이터가 저장되었습니다.');
                              await Future.delayed(const Duration(milliseconds: 500) ,() {
                                if (mounted) {  // 위젯이 여전히 마운트되어 있는지 확인
                                  ref.refresh(calendarEventProvider);
                                  ref.read(timeManagerProvider.notifier).selectedNextDay();
                                  _backupController.clear();
                                }
                              });
                              Navigator.pushReplacementNamed(context, '/main');
                            }else{
                              customMsg('데이터를 전부 붙여넣지 않았습니다\n맨 뒤 내용까지 확인해서 붙여넣어주세요');
                            }

                          }else{
                            customMsg('근로조건을 먼저 저장해주세요.');
                            Navigator.pop(context);
                          }
                        }, error: (err,trace){
                        }, loading: (){});

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
              const SizedBox(height: 30),
              BackUpDropdownBox(
                _one,
                _two,
                  (){
                  state.when(data: (val){
                    final histories = val.history.
                    where((e) => e.date.year == dropDownValue);
                    String jsonString = jsonEncode(histories.
                    map((e) => e.toJson()).toList());
                    if(histories.isEmpty){
                      customMsg('공수 데이터가 없습니다.');
                    } else {
                      Clipboard.setData(ClipboardData(text: jsonString));
                      customMsg('$dropDownValue년 공수 데이터가 복사되었습니다.');
                    }
                  },
                      error: (err,trace) => customMsg('공수 데이터가 없습니다.'),
                      loading: () => {});
                  },
              ),
              /// /// //////////////////////////////////////////
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
