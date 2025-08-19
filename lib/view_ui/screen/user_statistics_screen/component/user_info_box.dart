
import 'package:calendar_project_240727/base_app_size.dart';

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
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade900,
          width: 0.35,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
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
                    fontSize: (width > 400 ? 15.0 : (width < 376 ? 12.0 : 14.0)),
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
                  value,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    fontSize: (width >= 450 ? 40 : width > 400 ? 38.0 : 33.0),
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
                        fontSize: (width >= 450 ? 15 : width > 400 ? 14.5 : 14.0),
                      )),
                ),

              ],
            ),
            Text(
              text,
              maxLines: 2,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: (width >= 450 ? 11.0 : width > 400 ? 10.5 : width < 376 ? 9.0 : 9.5),
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
