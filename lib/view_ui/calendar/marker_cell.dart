import 'package:calendar_project_240727/core/utils/view_type.dart';
import 'package:calendar_project_240727/model/work_history_model.dart';
import 'package:calendar_project_240727/view_model/view_type_model.dart';
import '../../core/export_package.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../../theme_color.dart';

class MarkerCell extends ConsumerWidget {

  final DateTime date;
  final List<WorkHistory> events;

  const MarkerCell(this.date, this.events, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;
    final controllerFuture = ref.watch(viewTypeModelProvider);
    final viewTypeValue = AsyncValue.data(controllerFuture.value);

    ViewType? isViewType = ViewType.gongsu;

    viewTypeValue.when(data: (val) async {
      switch (val) {
        case ViewType.gongsu:
          isViewType = ViewType.gongsu;
          return ViewType.gongsu;

        case ViewType.amount:
           isViewType = ViewType.amount;
           return ViewType.amount;

        case ViewType.memo:
          isViewType = ViewType.memo;
          return ViewType.memo;

        default:
          isViewType = ViewType.gongsu;
          return ViewType.gongsu;
      }

    }, error: (err, stack) {},
        loading: () => ViewType.gongsu);

    final selectedMonth =
        ref.watch(timeManagerProvider.notifier).DaySelected.month;

    final month = date.month;

    if (events.isNotEmpty){
      final WorkHistory event = events[0];
      final calendarMemo = event.memo;

      final String memoEmptyText = selectedMonth == month ? calendarMemo.length > 1 ? '*' : '' : '';
      final String calendarText = selectedMonth == month ? event.record == 0.0 ? '휴일' : event.record.toString() : '';
      final String calendarMemoText = selectedMonth == month ? event.memo.toString() : '';
      final String calendarPayText = selectedMonth == month ? (event.pay/10000).toStringAsFixed(1) : '';

      final double fontSizeNonMemo = appWidth < 376
          ?  10.5

          : event.record == 0.0

          ?  11.5
          :  13;

      final double fontSizeMemo =  10.5;

      return Container(
        margin: EdgeInsets.only(
          top: appHeight < 700? 28.w : (
              appWidth <= 370 ? 33.5.w : appWidth > 450 ? 37.w : 35.w
          )),
        padding: EdgeInsets.all(1),
        alignment: Alignment.center,
        width: appHeight < 700 ?  37.5.w : 40.w,
        decoration: markerDeco(selectedMonth,month),
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
              children: [
              TextSpan(
              text: switch (isViewType) {
                ViewType.gongsu => memoEmptyText,
                ViewType.amount => memoEmptyText,
                ViewType.memo => '',
                _ => calendarText,
              },
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10),
              ),
                TextSpan(
                    text: switch (isViewType) {
                      ViewType.gongsu => calendarText,
                      ViewType.amount => calendarPayText,
                      ViewType.memo => calendarMemoText,
                      _ => calendarText,
                    },
                    style: TextStyle(
                      fontSize: switch(isViewType){
                      ViewType.gongsu => fontSizeNonMemo,
                      ViewType.amount => fontSizeNonMemo,
                      ViewType.memo => fontSizeMemo,
                      _ => fontSizeNonMemo,
                      },
                      fontWeight: Platform.isAndroid ? FontWeight.w900 : FontWeight.bold,
                      color: Colors.black,
                      height: textHeight,
                      shadows: Platform.isAndroid ? [
                        Shadow(
                          blurRadius: 1.0,
                          color: Colors.grey,
                          offset: Offset(0.5, 0.5),
                        ),
                      ] : null,

              )),


              ]
          ),
        ),
      );


    }
    return SizedBox();
  }
}


BoxDecoration  markerDeco(int selectedMonth,int month){
  return BoxDecoration(
    boxShadow: selectedMonth == month
        ? [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 1,
        blurRadius: 3,
        offset: const Offset(0, 2),
      ),
    ] : null,
    borderRadius: BorderRadius.circular(10.0),
    border: selectedMonth == month ? Border.all(
        color: Colors.grey.shade800,
        width: Platform.isAndroid ? 0.6 : 0.25) : null,
    shape: BoxShape.rectangle,
    color: selectedMonth == month
        ? Colors.grey.shade200
        : Colors.transparent,
  );
}


