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
    final amounts = [140000, 150000, 160000, 170000,180000];
    final sizes = DefaultSizes(context.width);

    return IntrinsicWidth(
      // height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemCount: amounts.length,
        padding: EdgeInsets.symmetric(horizontal: 5),
        itemBuilder: (context, index) {
          final amount = amounts[index];
          final isSelected = selectedValue == amount;

          return Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? 0 : 5,
              bottom: index == amounts.length - 1 ? 0 : 4,
            ),
            child: GestureDetector(
              onTap: () => onSelected(amount),
              child: Container(
                // color: Colors.teal,
                height: sizes.payChipSize,
                padding: EdgeInsets.symmetric(horizontal: isSelected ? 18 : 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    if (isSelected)
                      Container(
                        width: 2.0,
                        height: 12.5,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        color: context.textColor,
                      ),
                    TextWidget(
                      '${amount ~/ 10000}만',
                      13,
                      context.width,
                      fontWeight: FontWeight.w600,
                      // color: context.subTextColor
                    ),
                  ],
                )
              ),
            ),
          );
        },
      ),
    );
  }
}