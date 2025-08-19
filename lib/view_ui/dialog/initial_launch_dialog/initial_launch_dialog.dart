import 'package:calendar_project_240727/base_app_size.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../screen/user_statistics_screen/component/auth_modal_component.dart';
import '../dialog_text.dart';
import 'intro_text.dart';

class InitialLaunchDialog extends HookConsumerWidget {
  const InitialLaunchDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final width =  context.width;
    final height = context.height;


    // Transform.translate(
    //   offset: Offset(0, -0.5), // 위로 2픽셀 이동
    //   child: AnimatedEmoji(
    //     AnimatedEmojis.clap.mediumLight,
    //     repeat: true,
    //     animate: true,
    //     size: width > 400 ? 20 : 18,
    //   ),
    // ),

    return AlertDialog(
      title: TextWidget(Platform.isAndroid ? '안녕하세요 개발자입니다.' : '🎉 안녕하세요 개발자입니다.',
          16, width),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Colors.grey.shade200
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,horizontal: 12.0,
              ),
              child: initialText(height),
            ),
          ),


        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    showBasicModal(context,false);
                  },
                  child: ButtonTextWidget('시작하기',
                      15, color: Colors.grey.shade100),

                ),
              ),
            ],
          ),
        ),



      ],
    );
  }
}






