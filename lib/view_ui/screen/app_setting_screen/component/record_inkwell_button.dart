import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';

import '../../../../core/export_package.dart';

class RecordButton extends HookConsumerWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final GestureTapCallback? onTap;
  final Widget? icon;
  final double? width;

  const RecordButton(
      {super.key,
        this.backgroundColor,
        this.borderColor,
        this.onTap,
        this.icon,
        this.width,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(

      width: width ?? 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.bTypeChipColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: borderColor ?? Colors.grey.shade400,
          width: 2.0,
        ),
        boxShadow: context.defaultShadow,
      ),
      duration: const Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 4.0),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          child: InkWell(
            onTap: onTap,
            child: icon,
          ),
        ),
      ),
    );
  }
}
