import 'package:calendar_project_240727/repository/back_up/clipboard_service.dart';
import 'package:calendar_project_240727/repository/back_up/back_up_service.dart';

import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../firebase_analytics.dart';
import '../../../../model/work_history_model.dart';
import '../../dialog_text.dart';
import 'back_up_dialog_textSpan.dart';
import 'back_up_dropdown_box.dart';
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

    return AlertDialog(
      title: backUpTitle(context),
      content: Container(
        height: 310,
        width: appWidth > 500 ? appWidth/3 : appWidth,
        child: Column(
          children: [
            RichTextBox(appWidth),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Showcase(
                key: _three,
                targetPadding: const EdgeInsets.all(5),
                description: '👉 복사한 공수기록을 새 기기에 붙여넣기 해주세요',
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
                    hintText: '공수 기록을 붙여 넣어주세요',
                    onChanged: (val){
                      pasteFromClipboard(val);
                      setState(() => isStateEmpty = val.isEmpty);
                    },
                    iconOnPressed: isStateEmpty
                        ? null
                        : () async {
                      ref.read(backUpServiceProviderProvider.notifier).
                      processWorkHistory(context,workHistoryList);
                      if(mounted){
                        _backupController.clear();
                      }
                    },
                    iconColor: isStateEmpty
                        ? Colors.grey.shade700
                        : Colors.blue.shade700,
                  ),
                ),
              ),
            ),
            ErrorText('근로조건을 저장한 후에 공수 기록이 달력에 반영됩니다.', appWidth),
            const SizedBox(height: 30),
            BackUpDropdownBox(
              _one,
              _two,
                  () =>
                      ref.read(backUpClipboardServiceProvider.notifier).
                      clipboardHistory(),
            ),
            const SizedBox(height: 10),
            // HelpMsg(appWidth),
          ],
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
              child: ButtonTextWidget('취소',15),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
              child: ButtonTextWidget('확인',15),
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
        ref.read(firebaseAnalyticsClassProvider.notifier).
        backupInstructionEvent('Backup_Instruction_Event');
      },
      child: ButtonTextWidget('백업은 어떻게?',13, color: Colors.grey)
    ),
  );

}
