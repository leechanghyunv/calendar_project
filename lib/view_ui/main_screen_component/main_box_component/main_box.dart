
import '../../../core/export_package.dart';
import '../../../theme_color.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../minor_issue/widget/month_move_button.dart';
import '../chart_box_conponent/chart_box.dart';
import '../column_box_component/column_box.dart';
import 'main_box_big_container.dart';
import 'main_box_chip_list.dart';
import 'main_box_delete_button.dart';
import 'main_box_setting_button.dart';

class MainBox extends ConsumerWidget {
  const MainBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;
    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;


    return Container(
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: appWidth * 0.95,
      height: appWidth > 400 ? isFoldValue ? 325 : 370 : (appWidth < 376 ? 290 : 330),
      child: Padding(

        padding: EdgeInsets.symmetric(
          /// 갤럭시 23울트라, 24플러스에서 6줄일 경우 마지막달을 가리는 문제
            vertical: appWidth > 380 ? 10.0 : 6.0,
            horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: MainBoxDecoration,
              height: appWidth > 400 ? isFoldValue ? 140 : 170 : (appWidth < 376 ? 135 : 140),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0,
                        vertical: isFoldValue && appWidth > 500 ? 8.0 : 12.0),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainBoxBigContainer(),
                        const Divider(thickness: 1.0),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: appWidth * 0.9,
                          height: appWidth > 400 ? isFoldValue ? 25 : 35 : 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ChipList(),
                              Spacer(),
                              SizedBox(width: appWidth > 400 ? 7.5 : 5),
                              DeleteChip(),
                              SizedBox(width: appWidth > 400 ? 7.5 : 5),
                              SettingButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: appWidth > 450 ? isFoldValue ? 16 : 22.5 : 16,
                    child: Row(
                      children: [
                        MonthMoveButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            appWidth < 380 ? SizedBox(height: 7.5) : SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  flex: 12,
                    child: SmallContainer(),
                ),
                SizedBox(
                    width: 10,
                ),
                Expanded(
                  flex: 10,
                    child: ColumnReactiveBox()),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

BoxDecoration get MainBoxDecoration => BoxDecoration(
  color: boxColor,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ],
);
