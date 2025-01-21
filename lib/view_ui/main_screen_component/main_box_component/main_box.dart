import '../../../core/export_package.dart';
import '../../../theme_color.dart';
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

    return Container(
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: appWidth * 0.95,
      height: appWidth > 400 ? 380 : (appWidth < 376 ? 290 : 330),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: MainBoxDecoration,
              height: appWidth > 400 ? 170 : (appWidth < 376 ? 135 : 140),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appWidth < 376 ? SizedBox(height: 0) : SizedBox(height: 5),
                        MainBoxBigContainer(),
                        appWidth > 400 ? SizedBox(height: 10) : SizedBox(height: 0),
                        const Divider(thickness: 1.0),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: appWidth * 0.9,
                          height: appWidth > 400 ? 35 : 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DraggableChipList(),
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
                    right: 16,
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
                    child: SmallContainer(),
                ),
                SizedBox(width: 10),
                ColumnReactiveBox(),
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
