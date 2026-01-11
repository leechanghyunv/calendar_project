import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';

class RangeDateBox extends StatelessWidget {
  final String text;

  const RangeDateBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.width > 400 ? 40 : 35,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.75, color: Colors.grey.shade500),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: TextWidget(
          text, 15, context.width, color: context.textColor),
    );
  }
}

class RangeDateRow extends StatelessWidget {

  final String startDate;
  final String endDate;

  const RangeDateRow({super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: RangeDateBox(text: '${startDate}'),
        ),
        SizedBox(width: 10),
        Flexible(
          flex: 1,
          child: RangeDateBox(text: '${endDate}'),
        ),

      ],
    );
  }
}
