import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';

import '../../../../core/export_package.dart';
import '../dialog_text.dart';

class BackUpBox extends ConsumerWidget {

  const BackUpBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = context.width;
    final textSize = appWidth.responsiveSize([14,13.5,12.5,10.5,10,10]);
    final subTextSize = appWidth.responsiveSize([11,11,10,9,8,8]);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(7.5),
        border: context.isLight ? null : Border.all(width: 0.25,color: Colors.white),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: AnimatedContainer(
          color: Theme.of(context).scaffoldBackgroundColor,
          duration: const Duration(milliseconds: 100),
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    DialogTextWidget(
                      '1, 공수기록 백업을 눌러 기록 복사',
                      textSize,
                      color: context.textColor,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    DialogTextWidget(
                      '2, 카카오톡, 메일, SMS에 복사하기',
                      textSize,
                      color: context.textColor,

                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    DialogTextWidget(
                      '3, 새 기기에 공수 기록 코드 붙어넣기',
                      textSize,
                      color: context.textColor,

                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    DialogTextWidget(
                      '3, ',
                      textSize,
                      color: context.textColor,

                    ),
                    Icon(Icons.fingerprint,size: 17.5,),
                    DialogTextWidget(
                      '지문 아이콘 누르면 백업완료',
                      textSize,
                      color: context.textColor,

                    ),
                  ],
                ),
                SizedBox(height: 2.5),
                Row(
                  children: [
                    DialogTextWidget(
                      '     붙여넣기하면 지문 아이콘은',
                      subTextSize,
                      color: context.textColor,

                    ),
                    Icon(Icons.fingerprint,
                        size: 15,color: Colors.blue.shade600),
                    DialogTextWidget(
                      '색으로 변경',
                      subTextSize,
                      color: context.textColor,

                    ),
                  ],
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}
