import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_model/range_filted_model.dart';
import 'package:calendar_project_240727/view_ui/calendar/range_picker_component/range_view_container.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../theme_color.dart';
import '../../../view_model/history_model.dart';
import '../../minor_issue/widget/time_picker_widget.dart';

class DateRangeButton extends ConsumerWidget {
  const DateRangeButton({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;

    bool isRangeApplied = false;

    return GestureDetector(
      onTap: (){

        ref.contract.when(
          data: (contractData) {
            if (contractData.isNotEmpty) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.grey.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: TimePickerWidget(),
                  content: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 370,
                    child: Column(
                      children: [
                        Expanded(
                            child: RangeViewContainer(),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatefulBuilder(
                          builder: (context, setState){
                            return Row(
                              children: [
                                SizedBox(width: 5),
                                TextButton(
                                  onPressed: isRangeApplied ? () async {
                                    await ref.read(deleteMonthHistoryProvider(ref.startDate,ref.endDate));
                                    customMsg('이 기간의 공수기록 모두 삭제합니다');
                                    ref.refreshState(context);
                                    Navigator.pushReplacementNamed(context, '/main');
                                  } : null,
                                  child: Text('선택기간삭제',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: isRangeApplied ? Colors.black : Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () async {
                                    try{
                                      await ref.read(rangeFiltedSourceModelProvider(
                                          ref.startDate,ref.endDate));
                                      ref.refreshRange(context);
                                      setState(() {
                                        isRangeApplied = true; // 상태 업데이트
                                      });
                                    }catch(e){
                                      customMsg('시작일은 종료일보다 이전이어야 합니다.');
                                    }


                                  },
                                  child: Text('기간적용',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('나가기',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,color: Colors.black),
                                    )
                                ),

                              ],
                            );
                          }
                      ),




                    ),
                  ],
                ),
              );
            } else {
              customMsg('근로조건을 우선 입력해주세요');
            }
          },
          loading: () => customMsg('로딩 중...'),
          error: (error, stack) => customMsg('근로조건을 우선 입력해주세요'),
        );


      },

      child: Container(
        alignment: Alignment.center,
        width: appWidth > 400 ? 62.5 : 55,
        height: appWidth > 400 ? 26 : 23.5,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.black,
              width: Platform.isAndroid ? 1.5 : 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text('범위설정',
            style: TextStyle(

              fontSize: switch (appWidth) {
                > 450 => 14,
                > 420 => 13.5,
                > 400 => 13,
                _ => 12,
              },


              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
