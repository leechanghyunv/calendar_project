import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../core/export_package.dart';
import '../../view_model/view_provider/firebase_remote_config_model.dart';

class NewVersionDialog extends ConsumerWidget {
   NewVersionDialog({super.key});

  final InAppReview inAppReview = InAppReview.instance;


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final version = ref.watch(versionProvider.notifier).version;

    return AlertDialog(
      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('버전 업데이트',
              textScaler: TextScaler.noScaling,
              style: titleText),
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
              child: Text('${version}',
                  textScaler: TextScaler.noScaling,
                  style: titleText.copyWith(
                      color: context.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),

      content: Container(
        width: double.minPositive,
        child: Consumer(
            builder: (context, ref, child){
              final version = ref.watch(versionProvider);
              return switch(version){
              AsyncData(:final value) =>  Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...value.changes.map((e) => introBox(e.title, e.description)),
                ],
              ),
              AsyncError() => TextWidget('업데이트 정보를 불러올 수 없어요 😅', 15,
                  context.width, color: context.textColor),
              _ => const Text('............'),
              };
            }),
      ),

      actions: [
        TextButton(
          onPressed: () async {
            if (await inAppReview.isAvailable()) {
            inAppReview.requestReview();
            }
            },
          child: TextWidget('의견보내기', 15,
              context.width, color: context.textColor),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: TextWidget('확인', 15,
              context.width, color: context.textColor),
        ),
      ],
    );
  }
}



TextStyle get titleText => TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w900,
);

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

Widget introBox(String title, String description) => Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: 7.5),
    FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(title,
          textScaler: TextScaler.noScaling,
          style: contentText),
    ),
    SizedBox(height: 2.5),
    Text(description,
      textScaler: TextScaler.noScaling,
      style: contentText.copyWith(
          color: Colors.teal,
          fontSize: 11),
    ),
    SizedBox(height: 7.5),
  ],
);
