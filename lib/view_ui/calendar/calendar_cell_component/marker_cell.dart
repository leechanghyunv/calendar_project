import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/utils/view_type.dart';
import 'package:calendar_project_240727/model/work_history_model.dart';
import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/b_type_switch_provider.dart';
import '../../../core/export_package.dart';
import '../../../repository/time/calendar_time_controll.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../view_model/selected_memo_filter.dart';
import '../../../view_model/view_provider/calendar_switcher_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../../view_model/view_provider/view_type_model.dart';
import '../../screen/calendar_screen/provider/marker_event_provider.dart';
import 'cell_size.dart';



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

    final customEventMarkers = ref.watch(markerEventProvider);


    // ✅ bool 값으로 포함 여부 체크
    final localDate = DateTime(date.year, date.month, date.day);
    final hasCustomEvent = customEventMarkers.containsKey(localDate);


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

      final sizes = CellSizes(
          appHeight: appHeight,
          appWidth: appWidth,
          isFold: isFoldValue,
          recordAmount: event.record);

      final calendarMemo = event.memo;
      final String memoEmptyText = selectedMonth == month ? calendarMemo.length > 1 ? '*' : '' : '';
      final String calendarText = selectedMonth == month ? event.record == 0.0 ? '휴일' : event.record.toString() : '';
      final String calendarMemoText = selectedMonth == month ? event.memo.toString() : '';
      final String calendarPayText = selectedMonth == month ? (event.pay/10000).toStringAsFixed(1) : '';

      final double fontSizeMemo = appWidth > 450 ? 11.5 : 10.5;

      return Container(
        margin: EdgeInsets.only(
          top: sizes.calendarMargin,
        ),
        padding: EdgeInsets.all(1),
        alignment: Alignment.center,
        width: sizes.markerWidth,
        decoration: isExpanded ? null : markerDeco(ref,date,context.isLight,selectedMonth,month,hasEvent: hasCustomEvent),
        child: isExpanded
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 50.w,
              alignment: Alignment.center,
              decoration: markerDeco(
                ref,date,context.isLight,selectedMonth,month,

              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 1.0,
                ),
                child: Text(
                  maxLines: 1,
                  textScaler: TextScaler.noScaling,
                  calendarText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: textHeight,
                    fontSize: Platform.isAndroid ? null : appWidth < 376 ? 11.5 : 12.5,
                  ),
                ),
              ),
            ),
            appWidth < 376 ? SizedBox(height: 1.0) : SizedBox(height: 5),
            Flexible(
              child: Text(
                isOn ? calendarPayText : calendarMemoText,
                textScaler: TextScaler.noScaling,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  color: context.subTextColor,
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
                    color: context.isDark ? Colors.grey.shade100 : Colors.grey.shade800,
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
                      ViewType.gongsu => sizes.fontSizeNonMemo,
                      ViewType.amount => sizes.fontSizeNonMemo,
                      ViewType.memo => fontSizeMemo,
                      _ => sizes.fontSizeNonMemo,
                      },
                      fontWeight: FontWeight.bold,
                      color: context.isDark ? Colors.grey.shade100 : Colors.grey.shade800,
                      height: textHeight,

                      decoration: event.settlement ? TextDecoration.lineThrough : null,
                      decorationThickness: event.settlement ? 2.5 : null,


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




BoxDecoration  markerDeco(
    WidgetRef ref,
    DateTime date,
    bool isLight,
    int selectedMonth,
    int month,
    {bool hasEvent = false}){

  final isFiltered = ref.watch(isDateFilteredProvider(date));

  return BoxDecoration(
    boxShadow: selectedMonth == month
        ? [
      BoxShadow(
        color: Colors.grey.withOpacity(isLight ? 0.3 : 0.15),
        spreadRadius: 1,
        blurRadius: 3,
        offset: const Offset(0, 2),
      ),
    ] : null,
    borderRadius: BorderRadius.circular(10.0),
    border: selectedMonth == month ? Border.all(
        color: Colors.grey.shade800,
        width: 0.2) : null,
    shape: BoxShape.rectangle,
    color: selectedMonth == month
        ? isLight
        ? isFiltered ? Colors.grey.shade300 : Colors.grey.shade200
        : isFiltered ? Colors.grey.shade800 : Colors.grey.shade900
        : Colors.transparent,
  );
}


