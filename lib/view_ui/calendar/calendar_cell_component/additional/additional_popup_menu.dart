import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';

class AdditionalIconButton extends StatelessWidget {
  const AdditionalIconButton({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        HapticFeedback.selectionClick();
      },
      child: Icon(MdiIcons.dotsGrid,
          size: 15, color: context.subTextColor),
    );
  }
}
