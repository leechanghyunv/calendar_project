import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/provider/show_memo_history_provider.dart';

import '../../../../core/widget/text_widget.dart';
import '../../../../repository/time/date_range_controller.dart';
import '../../../../theme_color.dart';
import '../../../../view_model/filted_instance_model/search_source_model.dart';
import '../../../../view_model/sqlite_model/selected_model.dart';
import '../../statistic_screen/provider/info_box_provider.dart';

class HistoryMemoComponent extends HookConsumerWidget {

  final String start;
  final String end;
  final FocusNode historyMemoNode;
  final TextEditingController historyController;
  final ValueChanged<String>? onChanged;

  const HistoryMemoComponent(
      this.start,
      this.end,
      this.historyMemoNode,
      this.historyController,
      this.onChanged,
      // this.onPressed,
      {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;
    final  memoState =  ref.watch(showMemoHistoryStateProvider);;
    final state = ref.watch(searchSourceModelProvider);
    final timeRange = ref.watch(timeRangeManagerProvider);

    final data = ref.watch(infoBoxProvider)
        .whenData((d) => d).value ?? InfoBoxModel();

    useListenable(historyController);

    useEffect(() {
      if (memoState) {
        Future.microtask(() => historyMemoNode.requestFocus());
      }
      return null; // cleanup 필요 없음
    }, [memoState]);


    Decoration infoBoxDeco = BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey.shade900,
        width: 0.35,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
    );

    return memoState
        ? Container(
      height: 100,

      decoration: infoBoxDeco,
      alignment: Alignment.center,
      child: Column(
        children: [
          TextFormField(
            focusNode: historyMemoNode,
            controller: historyController,
            onChanged: onChanged,
            onFieldSubmitted: (value){
              ref.read(addSelectedProvider(
                timeRange.startDate,
                timeRange.endDate,
                  (state.value!.tax/100),
                  historyController.text,
                  ''
              ).future);

              customMsg('누적기록에서 저장내역 확인');
              Navigator.of(context, rootNavigator: true).pop();
            },
            minLines: 1,
            maxLines: 3, // 자동으로 여러 줄 입력 가능
            cursorColor: Colors.grey.shade500,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: (){
                  ref.read(addSelectedProvider(
                      timeRange.startDate,
                      timeRange.endDate,
                      (state.value!.tax/100),
                      historyController.text,
                      ''
                  ).future);

                  customMsg('누적기록에서 저장내역 확인');
                  Navigator.of(context, rootNavigator: true).pop();
              },
                  icon: Icon(Icons.fingerprint,
                    size: 25,
                    color: historyController.text.length > 5 ? Colors.blue : Colors.grey,
                  ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 4.0,
              ),
              hintText: ' 업체명,현장명 등을 입력하실 수 있어요',
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  overflow: TextOverflow.ellipsis),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 2.5),
                Spacer(),
                TextWidget('필요한 내용 입력후 우측에 지문 아이콘을 누르면 기록을 저장합니다',
                    11, appWidth,color: Colors.grey.shade500),
                SizedBox(width: 2.5),
              ],
            ),
          ),


        ],
      ),

    ) :
    Consumer(
        builder: (context,ref,child){
      final state = ref.watch(searchSourceModelProvider);
      return switch (state) {
        AsyncData(:final value) => Container(  // ✅ => 바로 Container
          height: 100,
          decoration: infoBoxDeco,
          alignment: Alignment.center,
          child: Builder(
            builder: (context) {
              final totalAmount = data.total.toInt();
              final currentAmount = value.total / 10000;
              final percentage = (currentAmount / totalAmount * 100).toStringAsFixed(1);

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget('${start} ~ ${end}', 16, appWidth, color: Colors.grey.shade800),
                  SizedBox(height: 7.5),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: textHeight,
                        color: Colors.grey.shade800,
                        fontSize: appWidth <= 376 ? 13.5 : (appWidth > 400 ? 16 : 14.5),
                        letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
                      ),
                      children: [
                        TextSpan(text: '총 금액 ${totalAmount}만원 에서 '),
                        TextSpan(
                          text: '${percentage}%',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: appWidth <= 376 ? 16 : (appWidth > 400 ? 18 : 17),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(text: ' 달성'),
                      ],
                    ),
                    textScaler: TextScaler.noScaling,
                  ),
                ],
              );
            },
          ),
        ),
        AsyncLoading() => SizedBox(height: 100),
        _ => SizedBox(height: 100),
      };
    });



  }
}
