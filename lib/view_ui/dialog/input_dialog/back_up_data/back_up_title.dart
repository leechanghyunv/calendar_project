import '../../../../core/export_package.dart';
import '../../dialog_text.dart';
import '../../dialog_widget.dart';

Widget backUpTitle(BuildContext context) {
  final appWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 8.0),
    child: SizedBox(
        width: appWidth > 500 ? appWidth / 2 : appWidth,
        child: Row(
          children: [
            DialogTextWidget(
                '📁 공수데이터 백업관리', 15.5),
            const Spacer(),
            AnimationDecoration(),

          ],
        )),
  );
}