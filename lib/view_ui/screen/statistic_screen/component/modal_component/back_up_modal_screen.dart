import '../../../../../core/export_package.dart';
import '../../../../../core/widget/text_widget.dart';
import '../../../../../model/work_history_model.dart';
import '../../../../../repository/back_up/archive_zlib_base64.dart';
import '../../../../../repository/back_up/back_up_service.dart';
import '../../../../dialog/backup_dialog/back_up_dialog_textSpan.dart';
import '../../../../dialog/backup_dialog/back_up_textfield.dart';
import '../../../../widgets/info_row.dart';
import '../function_chip.dart';

class BackUpModalScreen extends HookConsumerWidget {
  const BackUpModalScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

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

    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                bigText('공수데이터 백업관리', appWidth > 400 ? 17 : 15.5),
                Spacer(),
                FunctionChip(
                  label: '@시연해보기',
                  color:  Colors.grey.shade200,
                  borderColor:  Colors.grey.shade400,
                  textColor:  Colors.grey.shade900,
                  onTap: (){},
                ),
              ],
            ),
            SizedBox(height: 30),
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

            // BackUpBox(),
          ],
        ),
      ),
    );
  }
}
