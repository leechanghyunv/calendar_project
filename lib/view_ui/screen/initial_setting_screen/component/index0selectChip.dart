import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/size_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';

class PayChipsIndex0 extends HookWidget {
  final int selectedValue;
  final ValueChanged<int> onSelected;

  const PayChipsIndex0({required this.selectedValue, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final amounts = [140000, 150000, 160000, 170000];
    final sizes = DefaultSizes(context.width);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: amounts.length,
      padding: EdgeInsets.symmetric(vertical: 4),
      itemBuilder: (context, index) {
        final amount = amounts[index];
        final isSelected = selectedValue == amount;

        return Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? 0 : 4,
            bottom: index == amounts.length - 1 ? 0 : 4,
          ),
          child: GestureDetector(
            onTap: () => onSelected(amount),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: sizes.payChipSize,
              padding: EdgeInsets.symmetric(horizontal: isSelected ? 18 : 16),
              decoration: BoxDecoration(
                // color: isSelected
                //     ? context.isDark
                //     ? Colors.teal.shade900
                //     : Colors.teal
                //     : context.chipColor,
                // border: Border.all(
                //   color: isSelected ? Colors.teal : Color(0xFFE9ECEF),
                //   width: isSelected ? 2.5 : 2,
                // ),
                // borderRadius: BorderRadius.circular(12),
                // boxShadow: isSelected
                //     ? [
                //   BoxShadow(
                //     color: Colors.teal.withOpacity(0.1),
                //     blurRadius: 8,
                //     offset: Offset(0, 2),
                //   ),
                // ]
                //     : null,
              ),
              child: Row(
                children: [
                  Spacer(),
                  TextWidget(
                    '${amount ~/ 10000}만',
                    14,
                    context.width,
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? context.isDark
                        ? Colors.tealAccent
                        : Colors.white
                        : context.isDark
                        ? Colors.white
                        : Color(0xFF495057),
                  ),
                ],
              )
            ),
          ),
        );
      },
    );
  }
}