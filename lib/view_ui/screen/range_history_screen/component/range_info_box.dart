
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';

import '../../../../core/export_package.dart';

class RangeInfoBox extends StatelessWidget {
  final List<Widget> children;

  const RangeInfoBox({
    super.key, required this.children,

  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height > 750 ? (width > 400 ? 205.0 : (width < 375 ? 185.0 : 195.0)) : 180,
      width: width,
      decoration: context.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      ),
    );
  }
}
