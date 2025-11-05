import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_model/sqlite_model/selected_model.dart';
import '../../../../../../core/utils/converter.dart';
import '../../../../../../model/statistics/selected_history_model.dart';
import 'history_info_menuButton.dart';


class HistoryBox extends ConsumerWidget {
  final int index;
  final SelectedHistory selectedHistory;

  const HistoryBox(
      {super.key, required this.selectedHistory, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(viewContractProvider);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;


    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 4.0, vertical: height > 750 ? 8.0 : 4.0),
      child: Stack(
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: context.isDark ? Colors.grey.shade100 : Colors.grey.shade800,
                width: 0.35,
              ),
              boxShadow: context.isDark ? null : [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget('${formatSelectedDate(selectedHistory.startDate)} ~ ${formatSelectedDate(selectedHistory.endDate)}',
                      11, context.width,color: context.subTextColor),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7.0),
                    child: TextWidget('${selectedHistory.memo}',
                        18, context.width,color: context.textColor)
                  ),
                  Row(
                    children: [
                      Spacer(),
                      MomoChip(
                        selectedHistory: selectedHistory,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 7.5,
              right: 10,
              child: Row(
                children: [
                  SizedBox(width: 7.5),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 17,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      if (selectedHistory.id != null) {
                        ref.read(
                            deleteSelectedHistoryProvider(selectedHistory.id!));
                        customMsg('삭제되었습니다');
                      }
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashRadius: 15.0,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class MomoChip extends StatelessWidget {
  final SelectedHistory selectedHistory;

  MomoChip({super.key, required this.selectedHistory});

  List<String> get result {
    return [
      '${selectedHistory.record.toStringAsFixed(1)}공수',
      '${(selectedHistory.money / 10000).toInt()}만원',
      ' 더보기... ',
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Wrap(
      alignment: WrapAlignment.end,
      spacing: 8.0,
      runSpacing: 8.0,
      children: List.generate(result.length, (index) {
        final type = result[index];

        Widget  MoreText = TextWidget(type == ' 더보기... ' ? '$type' : '#$type',
            11, width,color: context.textColor);

        return type.isNotEmpty ?  Container(
          height: height > 750 ? (width > 400 ? 24 : 23) : 22,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: context.isDark ? Colors.black87 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: context.isDark ? Colors.grey.shade100 : Colors.grey.shade700,
              width: 0.25,
            ),
            boxShadow: context.defaultShadow,
          ),
          child: type == ' 더보기... '
              ? HistoryInfoMenuButton(selectedHistory: selectedHistory)
              : MoreText,
        ) : SizedBox.shrink();
      }),
    );
  }
}
