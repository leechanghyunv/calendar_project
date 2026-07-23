
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';

class MonthDeleteButton extends StatelessWidget {

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const MonthDeleteButton({super.key, required this.title, required this.subtitle, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 2.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    title, 13,
                    color: context.textColor),
                TextWidget(
                    subtitle, 11,
                    color: context.subTextColor),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
