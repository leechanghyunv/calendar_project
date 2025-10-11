import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../export_package.dart';

extension ThemeExtension on BuildContext {

  BoxDecoration get OpeningBoxDeco => BoxDecoration(
    color: boxColor,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      width: 0.75,
      color: isDark ? Colors.grey.shade400 : Colors.grey.shade900,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );


  BoxDecoration get cardDecoration => BoxDecoration(
    color: isDark ? Colors.black87 : Colors.grey.shade100,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: isDark ? Colors.grey.shade100 : Colors.grey.shade900,
      width: 0.35,
    ),
    boxShadow: isDark ? null : [
      BoxShadow(
        color: Colors.grey.shade300,
        blurRadius: 4,
        offset: const Offset(0, 4),
      ),
    ] ,
  );

  BoxDecoration get boxDecoration => BoxDecoration(
    color: boxColor,
    borderRadius: BorderRadius.circular(8),
    border: isLight ? null : Border.all(width: 0.25,color: Colors.white),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );




  BoxDecoration get chipDecoration => BoxDecoration(
    color: boxColor,
    borderRadius: BorderRadius.circular(8),
    border: isDark ? Border.all(width: 0.25, color: Colors.white) : null,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );

  List<BoxShadow>? get defaultShadow => isDark
      ? null
      : [
    BoxShadow(
      color: Colors.grey.shade300,
      blurRadius: 4,
      offset: const Offset(0, 3),
    ),
  ];

  Border? get defaultBorder => isDark ? Border.all(
    color:  Colors.tealAccent,
    width: 1.25,
  ) : null;

}