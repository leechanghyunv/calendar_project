import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import '../../../core/extentions/theme_dialog_extenstion.dart';
import '../../../view_model/view_provider/firebase_remote_config_model.dart';
import '../../screen/app_review_screen/app_review_screen.dart';
import '../../screen/question_screen/question_screen_modal.dart';
import '../../version_introduce/new_version_dialog.dart';
import '../main_box_component/main_box_sizes.dart';

class MainButtonSide extends HookConsumerWidget {
  const MainButtonSide({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = context.width;
    final version = ref.watch(versionProvider.notifier).version;

    final boxSizes = MainBoxSizes(
      width: appWidth,
    );

    useEffect(() {
      Future.microtask(() => ref.read(versionProvider.notifier).refreshConfig());
      return null;
    }, []);

    Widget sideButton(bool isDark, String msg) =>
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            children: [
              TextWidget(msg, 13, appWidth)

            ],
          ),
        );


    return Padding(
      /// 갤럭시 23울트라, 24플러스에서 6줄일 경우 마지막달을 가리는 문제
      padding: EdgeInsets.only(
          bottom: appWidth < 376 ? 2.5 : 10),

      /// 0
      child: PopupMenuButton<String>(
        color: context.isDark ? Colors.black87 : null,
        onSelected: (value) =>
        switch (value) {
          'option1' => context.dialog(NewVersionDialog()),
          'option2' => questionModal(context),
          'option3' => showReviewModal(context),
          _ => null,
        },
        padding: EdgeInsets.zero,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
        icon: Icon(
          Icons.more_vert,
          color: context.isDark ? Colors.grey.shade200 : Colors.grey.shade700,
          size: boxSizes.buttonSideIcon,
        ),
        itemBuilder: (BuildContext context) =>
        <PopupMenuEntry<String>>[

          PopupMenuItem<String>(
            value: 'option1',
            height: 30,
            child: sideButton(
                context.isDark,
                ' ${version} 버전 설명'),
          ),
          PopupMenuDivider(
            color: context.isDark ? Colors.white : null,
          ),
          PopupMenuItem<String>(
            value: 'option2',
            height: 30,
            child: sideButton(
                context.isDark,
                ' 자주 묻는 질문'),

          ),
          PopupMenuDivider(
            color: context.isDark ? Colors.white : null,
          ),
          PopupMenuItem<String>(
            value: 'option3',
            height: 30,
            child: sideButton(
                context.isDark,
                ' 의견 보내기'),

          ),
        ],
      ),
    );
  }
}


