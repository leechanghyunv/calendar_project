import 'package:flutter_svg/svg.dart';

import '../../../core/export_package.dart';
import '../../core/extentions/theme_color.dart';

class SvgImoJi extends StatelessWidget {
  final String nameLight;
  final String? nameDark;
  final double? width;

  const SvgImoJi({super.key, required this.nameLight,this.nameDark, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      context.isDark ? 'assets/$nameDark.svg' : 'assets/$nameLight.svg',
      width: width,
      colorFilter: context.isDark ? ColorFilter.mode(
        context.textColor,
        BlendMode.srcIn,
      ) : null,

    );
  }
}

class ChipImoJi extends StatelessWidget {
  final String? name;
  final double? width;

  const ChipImoJi({super.key, this.name, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/$name.svg',
      width: width,
      colorFilter: context.isDark ? ColorFilter.mode(
        context.textColor,
        BlendMode.srcIn,
      ) : null,

    );
  }
}
