
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';

import '../../../../core/export_package.dart';

class UserInfoBox extends StatelessWidget {
  final String name;
  final Widget? widget;
  final String unit;
  final String value;
  final String text;

  const UserInfoBox({
    super.key,
    required this.name,
    this.widget,
    required this.unit,
    required this.value,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final double height = context.height;
    final double width =  context.width;

    return Container(
      height: height > 750 ? (width > 400 ? 160.0 : (width < 375 ? 130.0 : 140.0)) : 125,
      width: width,
      decoration: context.cardDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(

                    fontSize: context.width.responsiveSize([15,12,12,12,11,10.8]),
                    color: Colors.grey.shade600,
                    fontWeight: Platform.isAndroid ? FontWeight.w600 : FontWeight.w900,
                  ),
                ),
                Spacer(),
                widget ?? const SizedBox.shrink(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${value}',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(

                    fontSize: context.width.responsiveSize([38,36,34,33,28,26]),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, right: 1.0),
                  child: Text(unit,
                      textScaler: TextScaler.noScaling,
                      style: TextStyle(

                        color: Colors.grey,
                        fontSize: context.width.responsiveSize([15,14,13,12,10,9]),
                      )),
                ),

              ],
            ),
            Text(
              text,
              maxLines: 2,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: context.width.responsiveSize([12,11,11,9.5,9,8.25]),
                color: context.isDark ? Colors.grey.shade100 : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
