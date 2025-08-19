import '../../../../core/export_package.dart';

class RecordButton extends HookConsumerWidget {
  final GestureTapCallback? onTap;
  final Widget? icon;
  final double? width;

  const RecordButton(
      {super.key,
        this.onTap,
        this.icon,
        this.width,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      height: 35,
      width: width ?? 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade900,
          width: 0.55,
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
