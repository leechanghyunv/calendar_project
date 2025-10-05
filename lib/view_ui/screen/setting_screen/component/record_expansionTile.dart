import 'package:calendar_project_240727/base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';

class CustomExpansionTile extends HookWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final VoidCallback? onTap;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            isExpanded.value = !isExpanded.value;
            onTap?.call();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(title, 15, context.width),
                    const SizedBox(height: 2.5),
                    TextWidget(subtitle, 12, context.width,
                        color: Colors.grey.shade500),
                  ],
                ),
                const Spacer(),
                AnimatedRotation(
                  turns: isExpanded.value ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isExpanded.value
              ? Padding(
            key: const ValueKey('expanded'),
            padding: const EdgeInsets.all(8.0),
            child: child,
          )
              : const SizedBox.shrink(key: ValueKey('collapsed')),
        ),
      ],
    );
  }
}