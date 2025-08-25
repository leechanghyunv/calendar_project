import 'package:calendar_project_240727/base_app_size.dart';

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
      height: 42.5,
      width: width ?? 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: borderColor ?? Colors.grey.shade400,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      duration: const Duration(seconds: 1),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          onTap: onTap,
          child: icon,
        ),
      ),
    );
  }
}
