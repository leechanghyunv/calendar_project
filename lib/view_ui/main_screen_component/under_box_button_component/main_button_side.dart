import 'package:calendar_project_240727/core/export_package.dart';

import '../../../app_review.dart';
import '../../../view_model/view_provider/firebase_remote_config_model.dart';
import '../../version_introduce/new_version_dialog.dart';

class MainButtonSide extends ConsumerStatefulWidget {
  const MainButtonSide({super.key});

  @override
  ConsumerState<MainButtonSide> createState() => _MainButtonSideState();
}

class _MainButtonSideState extends ConsumerState<MainButtonSide> {


  final InAppReview inAppReview = InAppReview.instance;


  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final version = ref.watch(versionProvider.notifier).version;
    return Padding(

      /// 갤럭시 23울트라, 24플러스에서 6줄일 경우 마지막달을 가리는 문제
      padding: EdgeInsets.only(bottom: appWidth < 380 ? 1.5 : 0),
      /// 0
      child: PopupMenuButton<String>(
        onSelected: (String value) async {
          switch (value) {
            case 'option1':
              showDialog(
                  context: context,
                  builder: (context) => NewVersionDialog(),
              );
              break;
            case 'option2':
              showDialog(
                context: context,
                builder: (context) => CustomReviewDialog(),
              );
              break;
          }
        },
        padding: EdgeInsets.zero,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        icon: Icon(
          Icons.more_vert,
          color: Colors.grey.shade700,
          size: appWidth > 450 ? 27 : 24, // 기존 아이콘 사이즈 유지
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

          PopupMenuItem<String>(
            value: 'option1',
            height: 40,
            child: sideButton(Platform.isAndroid ? ' ${version} 버전 설명' : '🚀 ${version} 버전 설명'),
          ),
          PopupMenuItem<String>(
            value: 'option2',
            height: 40,
            child: sideButton(Platform.isAndroid ? ' 의견 보내기' : '🍀 의견 보내기'),

          ),
        ],
      ),
    );
  }

  Widget sideButton(String msg) => Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(6),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    child: Row(
      children: [
        Text(
          msg,
          textScaler: TextScaler.noScaling,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );

}
