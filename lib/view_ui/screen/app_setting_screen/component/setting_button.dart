import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 2.0),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    title, 15,
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

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            TextWidget(title, 15, color: context.textColor),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

