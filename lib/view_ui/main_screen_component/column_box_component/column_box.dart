import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../core/export_package.dart';
import '../../../view_model/view_provider/column_box_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../main_box_component/main_box_sizes.dart';
import 'indicator_box.dart';

class ColumnReactiveBox extends ConsumerStatefulWidget {
  const ColumnReactiveBox({super.key});

  @override
  ConsumerState<ColumnReactiveBox> createState() => _ColumnReactiveBoxState();
}

class _ColumnReactiveBoxState extends ConsumerState<ColumnReactiveBox> {

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;

    final boxSizes = MainBoxSizes(
      width: appWidth,
      isFold: isFoldValue,
    );

    final state = ref.watch(columnStatisticsProvider);

    return Column(
      children: [
        buildStatsBox(
          width: appWidth,
          height: boxSizes.boxHeight,
          title: '근로신고일수',
          value: state.wrd.toDouble(),
          type: true,
          progress: state.wrdProgress,
          progressColor: context.isDark ? Colors.teal : Colors.teal,
          description: state.text1,
          context: context,
        ),
        appWidth < 380 ? SizedBox(height: 5) : SizedBox(height: 10),
        buildStatsBox(
          width: appWidth,
          height: boxSizes.boxHeight,
          title: '누적근로일수',
          value: state.workDayValue.toDouble(),
          type: false,
          progress: state.workDayProgress,
          /// Colors.indigo
          progressColor: context.isDark ? Colors.teal : Colors.blue,
          description: state.text2,
          context: context,
        ),
      ],
    );
  }
}
