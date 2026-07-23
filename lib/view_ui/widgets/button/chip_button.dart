
import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/extentions/theme_extension.dart';
import '../svg_imoji.dart';

class ChipButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final double borderWidth;

  const ChipButton({
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.borderWidth = 0.75,
  });

  @override
  Widget build(BuildContext context) {
    final appWidth = context.width;

    final height = appWidth.responsiveSize(
        [ Platform.isAndroid ? 22.5 : 23,
          Platform.isAndroid ? 22.5 : 23,
          Platform.isAndroid ? 21.5 : 23,
          Platform.isAndroid ? 21.5 : 22.5,
          Platform.isAndroid ? 20.5 : 21.5,
          Platform.isAndroid ? 18.5 : 19]
    );

    final iconBase = appWidth.responsiveSize([13.5, 12, 11.5, 11.5,10.5,9]);

    final iconSize = Platform.isAndroid ? iconBase - 1.5 : iconBase;

    final fontBase = appWidth.responsiveSize([13, 11.5, 11, 10.5, 9.5, 8.5],
    );

    final fontSize = Platform.isAndroid ? fontBase - (1.5) : fontBase;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: context.isLight ? Colors.grey.shade200 : Colors.black54,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:context.isLight ? 0.2 : 0.1),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey.shade800,
          width: isSelected ? 1.25 : borderWidth,
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: appWidth <= 375 ? 6.5 : 7.0,
            vertical: 1.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChipImoJi(
                name: icon,
                width: iconSize,
              ),
              Text(
                ' $label',
                textScaler: TextScaler.noScaling,
                style: TextStyle(
                  color: context.textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}