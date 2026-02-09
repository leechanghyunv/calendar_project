import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '/../../core/export_package.dart';

class MonthPopupButton extends HookConsumerWidget {

  final PopupMenuItemSelected<int>? onSelected;

  const MonthPopupButton({super.key, this.onSelected});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;
    final selectedMonths = useState<int?>(null);

    // 👇 텍스트 매핑
    String getButtonText() {
      if (selectedMonths.value == null) return '기간 선택';
      return '지난 ${selectedMonths.value}개월';
    }

    return PopupMenuButton<int>(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      offset: const Offset(0,  40),
      initialValue: 1,
        onSelected: (value) {
          selectedMonths.value = value; // 👈 상태 업데이트
          onSelected?.call(value);
        },
        itemBuilder: (context) => [
          PopupMenuItem(value: 1, child: TextWidget('지난 1개월', 14, appWidth,color: context.textColor)),
          PopupMenuItem(value: 2, child: TextWidget('지난 2개월', 14, appWidth,color: context.textColor)),
          PopupMenuItem(value: 3, child: TextWidget('지난 3개월', 14, appWidth,color: context.textColor)),
          PopupMenuItem(value: 6, child: TextWidget('지난 6개월', 14, appWidth,color: context.textColor)),
          PopupMenuItem(value: 12, child: TextWidget('지난 12개월', 14, appWidth,color: context.textColor)),
        ],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.boxColor,
          border: context.isLight
              ? Border.all(width: 0.75,color: Colors.black)
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
              TextWidget(getButtonText(), 14, appWidth, color: context.textColor),
              SizedBox(width: 5),
              Icon(Icons.arrow_drop_down, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
