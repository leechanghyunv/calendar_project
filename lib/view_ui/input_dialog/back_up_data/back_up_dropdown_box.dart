
import 'package:calendar_project_240727/view_ui/input_dialog/back_up_data/drop_down_value.dart';
import '../../../core/export.dart';
import '../../../core/widget/text_widget.dart';
import '../../../repository/calendar_time_controll.dart';

class BackUpDropdownBox extends ConsumerWidget {
  final GlobalKey introKey;
  final GlobalKey introKeyB;
  final void Function()? onTapB;

  const BackUpDropdownBox(
      this.introKey,
      this.introKeyB,
      this.onTapB,
      {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final timeManager = ref.watch(timeManagerProvider);
    final thisYear = timeManager.selected.year;
    final appWidth = MediaQuery.of(context).size.width;
    final dropDownValue = ref.watch(dropDownValueProvider);
    List<int> timeList = [thisYear-0, thisYear-1, thisYear-2, thisYear-3, thisYear-4, thisYear-5, thisYear-6, thisYear-7, thisYear-8, thisYear-9, thisYear-10];

    Widget dropDownText(String msg) => Text(msg,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.5, 10.0, 20.5),
        child: Column(
          children: [
            Row(
              children: [
                TextWidget('데이터 기간을 설정해주세요', 13, appWidth),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  width: 80,
                  height: 30,
                  child: Showcase(
                    key: introKey,
                    targetPadding: const EdgeInsets.all(5),
                    description: '👉 백업할 시간을 설정해주세요',
                    descTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    blurValue: 1.5,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        isExpanded: false,
                        isDense: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 0.5,
                          color: Colors.grey[800],
                        ),
                        value: dropDownValue, /// UI에서 어떤 항목이 표시되어야 하는지 결정합니다
                        hint: dropDownText(' ${timeList.first}년'),
                          items: timeList.map((int value) {
                            return DropdownMenuItem(
                              value: value, ///onChanged 콜백에서 어떤 항목이 선택되었는지 알려주는 데 사용됩니다.
                              child: dropDownText('$value년'),
                            );
                          }).toList(),
                          onChanged: (val){
                            ref.read(dropDownValueProvider.notifier).changeDropDownValue(val);
                          },
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.5),
            Showcase(
              key: introKeyB,
              targetPadding: const EdgeInsets.all(5),
              description: '👉 기존 디바이스(스마트폰)에서 복사하기로\n      외부에 데이터를 옮겨놓으세요\n\n     권장경로: 카카오톡, 이메일 나에게 보내기',
              descTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              blurValue: 1.5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTapB,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('선택하신 ${dropDownValue}년 데이터를 복사 합니다.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              color: Colors.grey[800],
                              fontSize: Platform.isAndroid
                                  ? appWidth > 500 ? (13 - 1.0).sp/2 : (13 - 1.0).sp
                                  : appWidth > 500 ? 13.sp/2 : 13.sp,
                            ),
                            ),
                            Text('글자를 그대로 누르면 설정하신 공수 데이터가 복사됩니다.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: Colors.blue[700],
                                fontSize: Platform.isAndroid
                                    ? appWidth > 500 ? (9 - 1.0).sp/2 : (9 - 1.0).sp
                                    : appWidth > 500 ? 4.5.sp : 9.sp,
                              ),
                            ),
                          ],

                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
