
import '../../base_app_size.dart';
import '../../core/export_package.dart';
import '../../core/extentions/theme_color.dart';
import '../../core/extentions/theme_extension.dart';
import '../../core/widget/text_widget.dart';
import 'svg_imoji.dart';

class LightBulbBox extends StatelessWidget {

  final String msg;

  const LightBulbBox({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {

    final LightBulbSize = context.width.responsiveSize([14, 12.5, 12, 11.5,10.5,9.5]);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 8.0),
          child: Row(
            children: [
              context.isDark ? SizedBox.shrink() : Padding(
                padding: const EdgeInsets.all(2.0),
                child: ChipImoJiFile(
                  name: 'LightBulb',
                  width: LightBulbSize,
                ),
              ),
              context.isDark ? SizedBox.shrink() : SizedBox(width: 2.5),
              Expanded(
                child: TextWidget(msg, 13.25, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
