import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/utils/view_type.dart';
import 'package:calendar_project_240727/model/work_history_model.dart';
import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/b_type_switch_provider.dart';
import '../../core/export_package.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../../theme_color.dart';
import '../../view_model/view_provider/calendar_switcher_model.dart';
import '../../view_model/view_provider/is_galaxy_fold.dart';
import '../../view_model/view_provider/view_type_model.dart';



class MarkerCell extends ConsumerWidget {

  final DateTime date;
  final List<WorkHistory> events;

  const MarkerCell(this.date, this.events, {super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth =  context.width;
    final appHeight = context.height;
    final controllerFuture = ref.watch(viewTypeModelProvider);
    final viewTypeValue = AsyncValue.data(controllerFuture.value);
    final switcher = ref.watch(calendarSwitcherProvider);
    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;
    final switchAsync = ref.watch(bTypeSwitchProviderProvider);
    final isOn = switchAsync.valueOrNull ?? false;

    final bool isExpanded = switcher.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );

     /// top side margin
    final double marginValue = appHeight < 700
        ? 28.w
        : (appWidth <= 370 ? isFoldValue ? 41.25.w : 35.w /// 갤럭시 폴드에서 40.w, 37.5가 적당함

        : appWidth > 500 ? isFoldValue ? 18.5.w : 25.w /// 원래값 47.5 갤럭시 폴드에서 32, 18.5.w가 적당함
        : Platform.isAndroid ? 37.5.w : 35.w); /// 값이 클수록 밑으로
          /// 안드 테스트폰으론 38.w 가 적당한 384


    ViewType? isViewType = ViewType.gongsu;

    viewTypeValue.maybeWhen(
        data: (val) async {
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
        },
        orElse: () => ViewType.gongsu);


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


      final double fontSizeNonMemo = switch ((appWidth, event.record)) {
        (< 376, _) => 11,
        (_, 0.0) => 11.5,
        (> 450, _) => 15.5,
        (_, _) => 13.0
      };

      final double fontSizeMemo = appWidth > 450 ? 11.5 : 10.5;

      return Container(
        margin: EdgeInsets.only(
          top: marginValue,
        ),
        padding: EdgeInsets.all(1),
        alignment: Alignment.center,
        width: isExpanded
            ? appHeight < 700 ?  42.5.w : appWidth > 500 ? 22.5.w : 45.w
            : appHeight < 700 ?  37.5.w : appWidth > 500 ? 22.5.w : 40.w,
        decoration: isExpanded ? null : markerDeco(selectedMonth,month),
        child: isExpanded
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 50.w,
              alignment: Alignment.center,
              decoration: markerDeco(selectedMonth,month),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 1.0,
                ),
                child: Text(
                  maxLines: 1,
                  calendarText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: textHeight,
                    fontSize: Platform.isAndroid ? null : appWidth < 376 ? 11.5 : 12.5,
                  ),
                ),
              ),
            ),
            appWidth < 376 ? SizedBox(height: 1.0) : SizedBox(height: 3),
            Flexible(
              child: Text(
                isOn ? calendarPayText : calendarMemoText,
                textScaler: TextScaler.noScaling,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                  height: textHeight,
                  fontSize: appWidth < 376 ? (isOn ? 10 : 9.5) : 10.5,
                ),
              ),
            ),
          ],
        )
            : RichText(
          textScaler: TextScaler.noScaling,
          maxLines: 1,
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
                  height: textHeight,
                    color: Colors.black,
                    fontSize: 8),
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
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: textHeight,
                      shadows: Platform.isAndroid ? [
                        Shadow(
                          blurRadius: 1.0,
                          color: Colors.grey,
                          offset: Offset(0.5, 0.5),
                        ),
                      ] : null,
                    ),
                ),
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
        width: Platform.isAndroid ? 0.6 : 0.2) : null,
    shape: BoxShape.rectangle,
    color: selectedMonth == month
        ? Colors.grey.shade200
        : Colors.transparent,
  );
}


