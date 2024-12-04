
import 'package:calendar_project_240727/model/work_history_model.dart';

import '../../core/export_package.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../../view_model/toggle_model.dart';

class MarkerCell extends ConsumerWidget {

  final DateTime date;
  final List<WorkHistory> events;

  const MarkerCell(this.date, this.events, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;
    final toggleManager = ref.watch(toggleModelProvider);
    final toggleValue = AsyncValue.data(toggleManager.value);

    bool? isToggle = false;

    toggleValue.when(
      data: (data) {
        isToggle = data;
        return data;
      },
      error: (err, stack) => false,
      loading: () => false,
    );

    final selectedMonth =
        ref.watch(timeManagerProvider.notifier)
            .DaySelected
            .month;
    final month = date.month;

    if (events.isNotEmpty){
      final WorkHistory event = events[0];
      final String code = event.colorCode;
      final calendarMemo = event.memo;
      Color mainColor = HexColor.fromHex(code);

      final String memoEmptyText = selectedMonth == month
          ? calendarMemo.length > 1 ? '*' : ''
          : '';

      final String calendarText = selectedMonth == month ? event
          .record == 0.0 ? '휴일' : event.record.toString() : '';

      final String calendarMemoText = selectedMonth == month ? event
          .memo.toString() : '';

      final double fontSizeNonMemo = appHeight < 700
          ? appWidth > 500
          ? 5.sp : 10.sp

          : event.record == 0.0

          ? appWidth > 500
          ? 5.25.sp : 10.5.sp

          : appWidth > 500
          ? 6.5.sp : 12.sp;

      final double fontSizeMemo = appWidth > 500 ? 5.25.sp : 10.5.sp;


      return Container(
        margin: EdgeInsets.only(
          top: appHeight < 700
              ? appWidth > 500 ? 15.w : 29.w  /// (se를 고려해야함)
              : appWidth > 500 ? 17.5.w : (appWidth <= 370 ? 33.5.w : 35.w),
        ),
        padding: EdgeInsets.all(1),
        alignment: Alignment.center,
        width: appHeight < 700
            ? appWidth > 500 ? 17.5.w : 37.5.w  /// (se를 고려해야함)
            : appWidth > 500 ? 20.w : 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
          color: selectedMonth == month
              ? Color(mainColor.value)
              : Colors.transparent,
        ),
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
              children: [
                TextSpan(
                  text: isToggle == false
                      ? memoEmptyText
                      : '',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10),
                ),
                TextSpan(
                    text: isToggle == false
                        ? calendarText
                        : calendarMemoText,
                    style: TextStyle(
                      fontSize: isToggle == false
                          ? fontSizeNonMemo
                          : fontSizeMemo,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ]
          ),
        ),
      );


    }
    return SizedBox();
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    Color color;
    try {
      String colorString = hexString;
      colorString = colorString.toUpperCase().replaceAll("#", "");
      if (colorString.length == 6) {
        colorString = "FF$colorString";
      }
      color = Color(int.parse(colorString, radix: 16));
    } on Exception {
      color = Colors.white;
    }
    return color;
  }
}


