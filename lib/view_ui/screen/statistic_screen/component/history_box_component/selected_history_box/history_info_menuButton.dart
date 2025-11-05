import '../../../../../../core/export_package.dart';
import '../../../../../../model/statistics/selected_history_model.dart';
import '../../../../../../core/extentions/theme_color.dart';
import '../../../../calendar_screen/provider/popup_menu_provider.dart';

class HistoryInfoMenuButton extends ConsumerStatefulWidget {

  final SelectedHistory selectedHistory;

  const HistoryInfoMenuButton({super.key, required this.selectedHistory});

  @override
  ConsumerState<HistoryInfoMenuButton> createState() => _HistoryInfoMenuButtonState();
}

class _HistoryInfoMenuButtonState extends ConsumerState<HistoryInfoMenuButton> {


  TextStyle get chartInStyle  => TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: Colors.grey.shade800,
  );

  TextStyle get chartSmallStyle  => TextStyle(
    fontSize: 9.5,
    fontWeight: FontWeight.w600,
    color: Colors.grey.shade400,
  );

  Widget chartInText(BuildContext context,String text){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(text,
          textScaler: TextScaler.noScaling,
          style: chartInStyle.copyWith(
            color: context.isDark ? Colors.grey.shade200 : null,
          )),
    );
  }

  Widget chartInSmall(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Text(text,
          textScaler: TextScaler.noScaling,
          style: chartSmallStyle.copyWith(color: Colors.grey.shade700)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final labels = ['직무', '세전', '세후', '공수', '기간'];

    return PopupMenuButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      onOpened: () => ref.read(popupMenuOpenProvider.notifier).open(),
      onCanceled: () => ref.read(popupMenuOpenProvider.notifier).close(),
      offset: const Offset(35, -140),
        itemBuilder: (context) => [
          PopupMenuItem(
            enabled: false,
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        chartInText(context,'- ${labels[1]}:'),
                        chartInText(context,'${(widget.selectedHistory.money / 10000).toInt()}만원',),
                      ],
                    ),
                    Row(
                      children: [
                        chartInText(context,'- ${labels[2]}:'),
                        chartInText(context,'${(widget.selectedHistory.afterTax / 10000).toInt()}만원',),
                      ],
                    ),
                    Row(
                      children: [
                        chartInText(context,'- ${labels[3]}:'),
                        chartInText(context,'${(widget.selectedHistory.record).toStringAsFixed(1)}공수',),
                      ],
                    ),
                    Row(
                      children: [
                        chartInText(context,'- ${labels[4]}:'),
                        chartInText(context,'${widget.selectedHistory.duration}개월'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      child: Text(
        ' 더보기... ',
        textScaler: TextScaler.noScaling,
        style: TextStyle(
          height: textHeight,
          fontSize: height > 750
              ? (width >= 450
              ? 13
              : width > 400
              ? 11
              : 10)
              : 9.5,
          fontWeight: FontWeight.bold,
          color: context.textColor,
        ),
      ),



    );
  }
}
