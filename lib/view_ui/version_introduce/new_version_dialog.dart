import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/version_introduce/version_manager.dart';

import '../../core/export_package.dart';
import '../../view_model/view_provider/firebase_remote_config_model.dart';

class NewVersionDialog extends ConsumerWidget {
   NewVersionDialog({super.key});

  final InAppReview inAppReview = InAppReview.instance;


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    ref.watch(versionManagerProvider.notifier);
    final version = ref.watch(versionProvider.notifier).version;
    Widget _label(String msg) => TextWidget(msg, 15, color: context.textColor);

    return AlertDialog(
      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget('버전 업데이트', 16,fontWeight: FontWeight.w900),

          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: context.chipColor,
                borderRadius: BorderRadius.circular(7.5),
              border: Border.all(
                color: Colors.grey.shade100,width: 0.75,),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.5,2.5,8.5,2.5),
              child: TextWidget('${version}', 15),
            ),
          ),
        ],
      ),

      content: Container(
        width: double.minPositive,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
                builder: (context, ref, child){
                  final version = ref.watch(versionProvider);
                  return switch(version){
                  AsyncData(:final value) =>  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...value.changes.map((e) => introBox(e.title, e.description,context)),
                    ],
                  ),
                  AsyncError() => _label('업데이트 정보를 불러올 수 없어요 😅'),
                  _ => const Text('............'),
                  };
                }),

          ],
        ),
      ),

      actions: [
        Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: () async {
                if (await inAppReview.isAvailable()) {
                  inAppReview.requestReview();
                }
              },
              child: _label('의견보내기')
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: _label('확인')
            ),
          ],
        ),


      ],
    );
  }
}




TextStyle get contentText => TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  height: Platform.isAndroid ? 1.2 : 1.4,
);

TextStyle get buttonText => TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

Widget introBox(String title, String description,BuildContext context) => Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: 7.5),
    FittedBox(
      fit: BoxFit.scaleDown,
      child: TextWidget(title, 15),
    ),
    SizedBox(height: 2.5),
    TextWidget(description, 11,color: Colors.teal),
    SizedBox(height: 7.5),
  ],
);
