
import '../../../../core/export_package.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double size;
  final VoidCallback? onPressed;

  const CircularIconButton({
    Key? key,
    required this.icon,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.blue,
    this.borderWidth = 2.0,
    this.size = 60,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(size / 2),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
              size: size * 0.75,
            ),
          ),
        ),
      ),
    );
  }
}


class CircularComponent extends StatelessWidget {

  final Widget child;
  final Color backgroundColor;
  final double width;
  const CircularComponent({super.key, required this.child, required this.backgroundColor, required this.width});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        width: width,
        height: appWidth > 400 ? 32 : 27.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Center(
            child: child,
        ),
      ),
    );
  }
}


