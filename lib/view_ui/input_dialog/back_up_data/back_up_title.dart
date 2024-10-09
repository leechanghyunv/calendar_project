import '../../../core/export.dart';
import '../../../core/widget/text_widget.dart';

Widget backUpTitle(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 8.0),
    child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            TextWidget(
                '📁 공수데이터 백업관리',
                15.5,
                MediaQuery.of(context).size.width),
            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  12.0),
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black, size: 20),
            ),

          ],
        )),
  );
}