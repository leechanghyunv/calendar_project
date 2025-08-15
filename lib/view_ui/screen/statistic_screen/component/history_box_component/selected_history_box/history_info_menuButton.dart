import '../../../../../../core/export_package.dart';
import '../../../../../../model/selected_history_model.dart';
import '../../../../../../theme_color.dart';

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

  Widget chartInText(String text){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(text,
          textScaler: TextScaler.noScaling,
          style: chartInStyle),
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

  List<String> get result {
    return [
      '${widget.selectedHistory.memo}',
      widget.selectedHistory.job.trim().isNotEmpty
          ? widget.selectedHistory.job
          : '',
      '${(widget.selectedHistory.money / 10000).toInt()}만원',
      '${widget.selectedHistory.record}공수',
      '${widget.selectedHistory.duration}개월'
    ];
  }


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final labels = ['직무', '세전', '세후', '공수', '기간'];
    final values = result.skip(1).toList();

    return PopupMenuButton(
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      offset: const Offset(35, -140),
        itemBuilder: (context) => [
          PopupMenuItem(
            enabled: false,
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
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
                        chartInText('- ${labels[1]}:'),
                        chartInText(values[1]),
                      ],
                    ),
                    Row(
                      children: [
                        chartInText('- ${labels[2]}:'),
                        chartInText(values[2]),
                      ],
                    ),
                    Row(
                      children: [
                        chartInText('- ${labels[3]}:'),
                        chartInText(values[3]),
                      ],
                    ),
                    Row(
                      children: [
                        chartInText('- ${labels[4]}:'),
                        chartInText(values[4]),
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
          color: Colors.black,
        ),
      ),



    );
  }
}
