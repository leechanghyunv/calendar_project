import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import '../../../core/export_package.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../minor_issue/widget/month_move_button.dart';
import '../chart_box_conponent/chart_box.dart';
import '../column_box_component/column_box.dart';
import 'controll_chip_component.dart';
import 'main_box_big_container.dart';
import 'size_module/main_box_sizes.dart';


class MainBox extends ConsumerWidget {
  const MainBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final isFold = ref.watch(isGalaxyFoldProvider);

    final isFoldValue = isFold.asData?.value ?? false;
    final width = context.width; // ✅ 한 번만 가져오기

    final boxSizes = MainBoxSizes(
      width: width,
      isFold: isFoldValue,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      width:  width * 0.95,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: context.boxDecoration,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: isFoldValue && width > 500 ? 6.0 : boxSizes.verticalPadding,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainBoxBigContainer(),
                        Divider(thickness: 1.0),
                        UnifiedChipBar(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: boxSizes.contentPadding,
                    child: Row(
                      children: [
                        MonthMoveButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            width < 380 ? SizedBox(height: 7.5) : SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  flex: isFoldValue ? 11 : 12,
                    child: SmallContainer(),
                ),
                SizedBox(
                    width: 10,
                ),
                /// SearchChipBox
                /// ColumnReactiveBox()
                Expanded(
                  flex: 10,
                    child: ColumnReactiveBox(),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
