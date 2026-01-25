import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
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
      backgroundColor: context.dialogColor,
      shape: context.dialogShape,
      title: BackupTitleBox(
        focusNode: _backupNode,
      ),
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              BackUpDialogTextSpan(),


              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: context.bTypeChipColor,
                    border: Border.all(
                        color: Colors.grey.shade700,
                        width: 0.85),
                    boxShadow: context.isDark ? null : [
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
                        ? context.isDark ? Colors.grey.shade700 : Colors.grey.shade200
                        : context.isDark ? Colors.blue.shade700 : Colors.blue.shade200,
                  ),
                ),


              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: TextWidget(' 근로조건을 저장한 후에 공수 기록이 달력에 반영됩니다.',
                    11, appWidth),
              ),
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
                  // customMsg('버전충돌문제로 잠시 서비스 지원을 중단합니다');
                  },
                child: TextWidget('공수기록 백업', 14, context.width)
            ),
            TextButton(
              onPressed: () {
                ref.read(selectedIndexProvider.notifier).setIndex(1);
                Navigator.of(context).pop();
                context.go('/calendar');
              },
              child: TextWidget('확인', 14, context.width),
            ),
          ],
        ),

      ],
    );
  }


}
