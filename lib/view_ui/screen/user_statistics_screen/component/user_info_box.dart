
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

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



    final valueInt = context.width.responsiveSize([38, 36, 34, 33, 31, 28]);
    final valueDecimal = context.width.responsiveSize([20, 19, 18, 17, 16, 15]);

    return Container(
      decoration: context.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0,16.0,12.0,10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget(name, 13.5,color: Colors.grey.shade600),
                Spacer(),
                widget ?? const SizedBox.shrink(),
              ],
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textScaler: TextScaler.noScaling,
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: context.isDark ? Colors.white : Colors.black,
                    ),
                    children: () {
                      final parts = value.split('.');
                      if (parts.length == 2) {
                        return [
                          TextSpan(
                            text: parts[0],
                            style: TextStyle(fontSize: valueInt),
                          ),
                          TextSpan(
                            text: '.${parts[1]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: valueDecimal + 2,
                            ),
                          ),
                        ];
                      }
                      return [
                        TextSpan(
                          text: value,
                          style: TextStyle(fontSize: valueInt),
                        ),
                      ];
                    }(),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, right: 1.0),
                  child: TextWidget(unit,12.5,color: Colors.grey),
                ),

              ],
            ),
            SizedBox(height: 16),
            TextWidget(
                text, 10,color: context.isDark ? Colors.grey.shade100 : Colors.grey.shade700,
            fontWeight: FontWeight.normal,maxLines: 2),
          ],
        ),
      ),
    );
  }
}
