import 'package:calendar_project_240727/repository/back_up/clipboard_service.dart';
import 'package:calendar_project_240727/repository/back_up/back_up_service.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../model/work_history_model.dart';
import '../../../repository/back_up/archive_zlib_base64.dart';
import '../../../view_model/view_provider/focus_node_listner.dart';
import '../../../view_model/view_provider/main_button_index_provider.dart';
import '../dialog_text.dart';

import 'back_up_dialog_textSpan.dart';
import 'back_up_dropdown_box.dart';
import 'back_up_textfield.dart';
import 'back_up_title.dart';

class BackUpDialog extends HookConsumerWidget {
  const BackUpDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final isFocused = ref.watch(focusStateProvider);

    final _backupController = useTextEditingController();
    final _backupNode = useFocusNode();
    final isStateEmpty = useState(true);
    final workHistoryList = useState<List<WorkHistory>?>(null);

    Future<void> pasteFromClipboard(String externalData) async {
      try {
        final output = await ZlibBase64().decompress(externalData);
        final jsonList = jsonDecode(output) as List;
        workHistoryList.value =
            jsonList.map((item) => WorkHistory.fromJson(item)).toList();
      } catch (e) {
        print('데이터 변환 중 오류 발생: $e');
      }
    }

    useEffect(() {
      void listener() {
        ref.read(focusStateProvider.notifier).setFocus(_backupNode.hasFocus);
      }

      _backupNode.addListener(listener);
      return () => _backupNode.removeListener(listener);
    }, [_backupNode]);




    return AlertDialog(
      title: BackupTitleBox(
        focusNode: _backupNode,
      ),
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              BackUpDialogTextSpan(),


              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,

                    border: Border.all(
                        color: Colors.grey.shade700,
                        width: 0.85),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: BackUpTextField(
                    controller: _backupController,
                    backupNode: _backupNode,
                    hintText: ' 공수 기록을 붙여 넣어주세요',
                    onChanged: (val){
                      pasteFromClipboard(val);
                      isStateEmpty.value = val.isEmpty;
                    },
                    iconOnPressed: isStateEmpty.value
                        ? null
                        : () async {
                      ref.read(backUpServiceProviderProvider.notifier).
                      processWorkHistory(context,workHistoryList.value);
                      Navigator.of(context).pop();
                      _backupController.clear();
                    },
                    iconColor: isStateEmpty.value
                        ? Colors.grey.shade700
                        : Colors.blue.shade700,
                  ),
                ),
              ),
              ErrorText(' 근로조건을 저장한 후에 공수 기록이 달력에 반영됩니다.', appWidth),
              SizedBox(height: 20),
              BackUpBox(),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ref.read(backUpClipboardServiceProvider.notifier).clipboardHistory();
                  },
                child: ButtonTextWidget('공수기록 백업',14, color: Colors.black)
            ),
            TextButton(
              onPressed: () {
                ref.read(selectedIndexProvider.notifier).setIndex(1);
                Navigator.of(context).pop();
                context.go('/calendar');
              },
              child: ButtonTextWidget('확인',15),
            ),
          ],
        ),

      ],
    );
  }


}
