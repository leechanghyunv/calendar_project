
import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/view_ui/screen/back_up_screen/provider/screen_type_provider.dart';

import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';
import '../../../repository/back_up/clipboard_service.dart';
import '../../dialog/backup_dialog/back_up_textfield.dart';
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

    useEffect(() {
      isStateEmpty.value = true;
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
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Column(
                        children: [
                          GuildText(context,'복사 후 카카오톡,이메일 등 외부 보관 후 새 기기에 붙여넣기'),

                        ],
                      ),
                    ),

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
                    child: BackUpTextField(
                      controller: _backupController,
                      backupNode: _backupNode,
                      onChanged: (val){
                        isStateEmpty.value = val.isEmpty;
                      },
                    ),
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
                        // ref.read(backUpClipboardServiceProvider.notifier).getCompressedHistory();
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
                        handleTypeChange(BackupScreenType.import);
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
