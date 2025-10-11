import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../export_package.dart';

extension ThemeExtension on BuildContext {

  RoundedRectangleBorder get dialogShape => RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: isDark
        ? const BorderSide(color: Colors.white, width: 0.25)
        : BorderSide.none,
  );


}