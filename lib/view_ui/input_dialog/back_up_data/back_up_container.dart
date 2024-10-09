import 'package:showcaseview/showcaseview.dart';

import '../../../core/export.dart';
import '../../../core/widget/text_widget.dart';
import '../../../repository/calendar_time_controll.dart';

class BackUpContainer extends ConsumerWidget {
  final GlobalKey introKey;
  final GlobalKey introKeyB;
  final void Function()? onTapA;
  final void Function()? onTapB;
  final void Function()? onTapC;

  const BackUpContainer(
      this.onTapA,
      this.onTapB,
      this.onTapC,

      this.introKey,
      this.introKeyB,

      {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeManager = ref.watch(timeManagerProvider);
    final thisYear = timeManager.selected.year;
    final appWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 20.5, 10.0, 20.5),
        child: Column(
          children: [
            Row(
              children: [
                TextWidget(' ${timeManager.selected.year-0}년 근로공수 데이터 복사하기', 13,
                    appWidth),
                const Spacer(),
                Showcase(
                  key: introKey,
                  description: '👉 기존 디바이스(스마트폰)에서 복사하기로\n      외부에 데이터를 옮겨놓으세요\n\n     권장경로: 카카오톡, 이메일 내에게보내기',
                  descTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  blurValue: 1.5,
                  child: GestureDetector(
                      onTap: onTapA,
                      child: const Icon(
                        Icons.copy_all,
                        color: Colors.black,
                      )),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                BackupTextWidget(' ${timeManager.selected.year-1}년 근로공수 데이터 복사하기', 13,
                    Colors.grey.shade800, appWidth),
                const Spacer(),
                GestureDetector(
                    onTap: onTapB,
                    child: Icon(
                      Icons.copy_all,
                      color: Colors.grey.shade800,
                    ))
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                BackupTextWidget(' ${timeManager.selected.year-2}년 근로공수 데이터 복사하기', 13,
                    Colors.grey.shade600, appWidth),
                const Spacer(),
                Showcase(
                  description: '👉 데이터는 현재 기준 3년치 저장가능 합니다\n\n     더 이전 데이터는 달력에서 시점을 변경 후\n     (ex 2023년 10월로 변경) 이용하세요 ',
                  descTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  blurValue: 1.5,
                  key: introKeyB,
                  child: GestureDetector(
                      onTap: onTapC,
                      child:  Icon(
                        Icons.copy_all,
                        color: Colors.grey.shade600,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
