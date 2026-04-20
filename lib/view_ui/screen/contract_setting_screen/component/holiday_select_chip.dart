import 'package:calendar_project_240727/core/export_package.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../base_app_size.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/extentions/theme_extension.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../core/widget/toast_msg.dart';

class HolidaySelectChip extends HookConsumerWidget {

  final ValueNotifier<bool> containHoliDay;


  const HolidaySelectChip({super.key, required this.containHoliDay});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final iconSize = context.width.responsiveSize([13.5, 12, 11.5, 11.5,10.5,9]);

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [

          Spacer(),
          GestureDetector(
            onTap: () {
              HapticFeedback.selectionClick();
              containHoliDay.value = !containHoliDay.value;
              customMsg(containHoliDay.value ? '공휴일포함' : '공휴일제외');

            },
            child: Container(
              decoration: BoxDecoration(
                color: context.isDark ? Colors.black87 : Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                child: Row(
                  children: [
                    ChipImoJiHoliday(
                      name: 'name_Tag',
                      width: iconSize,
                    ),
                    SizedBox(width: 1.5),
                    TextWidget(
                      containHoliDay.value ?  ' 공휴일포함 ' : ' 공휴일제외 ',
                      13,
                      context.width,
                      color: context.subTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChipImoJiHoliday extends StatelessWidget {
  final String? name;
  final double? width;

  const ChipImoJiHoliday({super.key, this.name, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/$name.svg',
      width: width,
    );
  }
}
