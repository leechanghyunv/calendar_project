import 'package:calendar_project_240727/base_app_size.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';

class SearchDurationDropdown extends StatelessWidget {
  const SearchDurationDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.boxColor,
        border: context.isLight
            ? Border.all(width: 0.75,color: Colors.grey.shade700)
            : Border.all(width: 0.75,color: Colors.white),
        borderRadius: BorderRadius.circular(8.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('1개월', 14, context.width, color: context.textColor),
            Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }
}


