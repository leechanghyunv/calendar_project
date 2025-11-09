import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/widget/text_widget.dart';
import '/../../core/export_package.dart';

class MonthPopupButton extends StatefulWidget {

  final PopupMenuItemSelected<int>? onSelected;

  const MonthPopupButton({super.key, this.onSelected});

  @override
  State<MonthPopupButton> createState() => _MonthPopupButtonState();
}

class _MonthPopupButtonState extends State<MonthPopupButton> {
  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    return PopupMenuButton<int>(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      offset: const Offset(0,  200),
      initialValue: 1,
        onSelected: widget.onSelected,
        itemBuilder: (context) => [
          PopupMenuItem(value: 1, child: TextWidget('지난 1개월', 14, appWidth,color: context.textColor)),
          PopupMenuItem(value: 2, child: TextWidget('지난 2개월', 14, appWidth,color: context.textColor)),
          PopupMenuItem(value: 3, child: TextWidget('지난 3개월', 14, appWidth,color: context.textColor)),
          PopupMenuItem(value: 6, child: TextWidget('지난 6개월', 14, appWidth,color: context.textColor)),
          PopupMenuItem(value: 12, child: TextWidget('지난 12개월', 14, appWidth,color: context.textColor)),
        ],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: context.boxColor,
          border: context.isLight ? null : Border.all(width: 0.35,color: Colors.white),
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('기간 선택', 15, appWidth, color: context.textColor),
            SizedBox(width: 5),
            Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }
}
