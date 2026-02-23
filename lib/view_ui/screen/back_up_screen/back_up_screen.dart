import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/back_up_screen/provider/screen_type_provider.dart';

import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/extentions/theme_extension.dart';
import '../../../model/work_history_model.dart';
import '../../../repository/back_up/archive_zlib_base64.dart';
import '../../../repository/back_up/back_up_service.dart';
import '../../../repository/back_up/clipboard_service.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import 'component/back_up_textfield.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/info_row.dart';
import '../../widgets/left_eleveted_button.dart';
import 'component/guild_text.dart';

void backupScreenModal(BuildContext context) {
  context.showModal(
    heightRatio: 0.75,
    child: BackUpScreen(),
  );
}


class BackUpScreen extends HookConsumerWidget {
  const BackUpScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final type = ref.watch(backupScreenTypeProvider);

    final _backupController = useTextEditingController();
    final _backupNode = useFocusNode();

    final isStateEmpty = useState(true);

    void handleTypeChange(BackupScreenType newType) {
      HapticFeedback.selectionClick();
      ref.read(backupScreenTypeProvider.notifier).state = newType;
    }

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
      Future.microtask(() {
        ref.read(backupScreenTypeProvider.notifier).state = BackupScreenType.default_;
        isStateEmpty.value = true;
      });
      return null;
    }, []);


    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 40),
                InfoRow(
                  title: '공수기록 백업관리',
                  // subtitle: '등록된 공수를 기반으로 통계를 보여드립니다.',
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.isDark ? Colors.white : Colors.white,
                        width: context.isDark ? 0.75 : 0.35,
                      ),
                      borderRadius: BorderRadius.circular(7.5),
                      color: context.isDark ? Colors.black : Colors.grey.shade200,
                    ),
                    child: GuildText(context,type.guideText),

                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.isDark ? Colors.white : Colors.grey.shade700,
                        width: context.isDark ? 0.75 : 0.35,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.grey.shade100,
                    ),
                    child: switch (type) {
                      BackupScreenType.export => HookBuilder(
                        builder: (context) {
                          final output = useState<String>('');
                          useEffect(() {
                            final notifier = ref.read(backUpClipboardServiceProvider.notifier);
                            notifier.getCompressedHistory().then((val) => output.value = val);
                            return null;
                          }, []);
                          return SingleChildScrollView(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              output.value.isEmpty ? '데이터 없음' : output.value,
                              style: TextStyle(
                                  fontSize: context.width.responsiveSize([13,12,12,12,11,10.5]),
                                  color: Colors.black),
                            ),
                          );
                        },
                      ),
                      BackupScreenType.import => BackUpTextField(
                        controller: _backupController,
                        backupNode: _backupNode,
                        hintText: ' 압축된 공수기록을 붙여넣어주세요',
                        onChanged: (val) {
                          isStateEmpty.value = val.isEmpty;
                          pasteFromClipboard(val);
                        },
                      ),
                      BackupScreenType.default_ => Consumer(
                          builder: (context,ref,child){
                        final history = ref.watch(viewHistoryProvider);
                        final msg = switch (history) {
                          AsyncData(:final value) => value.isEmpty
                              ? '저장된 공수 기록이 없습니다.'
                              : '${value.length}건의 공수 기록이 저장되어 있습니다',
                          AsyncLoading() => '불러오는 중...',
                          _ => '오류가 발생했습니다.',
                        };
                        return Row(
                          crossAxisAlignment: .start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: TextWidget(msg, 13.5,
                                  context.width,color: context.subTextColor),
                            ),
                          ],
                        );
                      }
                      ),

                    },
                  ),
                ),


              ],
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  if (isStateEmpty.value)
                  Expanded(
                    child: LeftElevatedButton(
                      text: '공수기록 복사하기',
                      onPressed: () {
                        ref.read(backUpClipboardServiceProvider.notifier).clipboardHistory();
                        handleTypeChange(BackupScreenType.export);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      text: isStateEmpty.value ? '공수기록 붙여넣기' : '공수기록 적용하기',
                      onPressed: () {
                        switch (type) {
                          case BackupScreenType.default_:
                            handleTypeChange(BackupScreenType.import);
                            _backupNode.requestFocus();
                          case BackupScreenType.import:
                            ref.read(backUpServiceProviderProvider.notifier)
                                .processWorkHistory(context, workHistoryList.value);
                            Navigator.of(context).pop();
                            _backupController.clear();
                          case _:
                            break;
                        }

                      },
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
