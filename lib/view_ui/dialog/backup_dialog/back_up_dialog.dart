import 'package:calendar_project_240727/repository/back_up/clipboard_service.dart';
import 'package:calendar_project_240727/repository/back_up/back_up_service.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../firebase_analytics.dart';
import '../../../model/work_history_model.dart';
import '../../../repository/back_up/archive_zlib_base64.dart';
import '../dialog_text.dart';

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
  final TextEditingController _backupController = TextEditingController();
  final FocusNode _backupNode = FocusNode();
  List<WorkHistory>? workHistoryList;


  @override
  void dispose() {
    _backupController.dispose();
    super.dispose();
  }

  Future<void> pasteFromClipboard(String externalData) async {
    try {
      final output = await ZlibBase64().decompress(externalData);
      List<dynamic> jsonList = jsonDecode(output);
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
      title: BackupTitleBox(
        focusNode: _backupNode,
      ),
      content: SingleChildScrollView(
        child: Container(
          height:  370,
          width:  appWidth,
          child: Column(
            children: [
              RichTextBox(appWidth),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey.shade700),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: BackUpTextfield(
                    controller: _backupController,
                    backupNode: _backupNode,
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
              ErrorText('근로조건을 저장한 후에 공수 기록이 달력에 반영됩니다.', appWidth),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1.5,
              ),
              SizedBox(height: 10),
              BackUpBox(),
              SizedBox(height: 10),
             
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            TextButton(
                onPressed: () =>
                  ref.read(backUpClipboardServiceProvider.notifier).clipboardHistory(),
                child: ButtonTextWidget('공수기록 백업',14, color: Colors.black)
            ),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
              child: ButtonTextWidget('확인',15),
            ),
          ],
        ),

      ],
    );
  }


}
