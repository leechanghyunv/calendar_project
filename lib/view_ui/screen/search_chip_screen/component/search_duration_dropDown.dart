import '../../../../core/widget/text_widget.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';

class SearchDurationDropdown extends HookConsumerWidget {
  final ValueNotifier<String> controller;

  const SearchDurationDropdown({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;

    return PopupMenuButton<String>(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      offset: const Offset(0, 40),
      initialValue: controller.value,
      onSelected: (value) => controller.value = value, // 👈 외부 controller 업데이트
      itemBuilder: (context) => ['1개월','2개월','3개월','6개월','12개월']
          .map((e) => PopupMenuItem(
        value: e,
        child: TextWidget(e, 14, appWidth, color: context.textColor),
      ))
          .toList(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: context.isLight
              ? Border.all(width: 0.75, color: Colors.grey.shade700)
              : Border.all(width: 0.75, color: Colors.white),
          borderRadius: BorderRadius.circular(8.5),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 1, offset: Offset(0, 1)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(controller.value, 14, appWidth, color: context.textColor),
              SizedBox(width: 5),
              Icon(Icons.arrow_drop_down, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}