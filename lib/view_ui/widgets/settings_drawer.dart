import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../core/export_package.dart';

class SettingsDrawer extends HookConsumerWidget {
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('Icon/appstore.png'),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextWidget('워크캘린더', 15, context.width),
                        TextWidget('version 1.5.7', 8.5, context.width),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_circle_right_outlined),
                  ],
                ),

                SizedBox(height: 10),

                Expanded(
                  child: Container(
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget('infomationinfomationinfomationinfomationinfomationinfomationinfomationinfomationinfomationinfomationinfomationomationinfomationinfomationomationinfomationinfomationomationinfomationinfomationomationinfomationinfomationomationinfomationinfomation', 9.5, context.width),
                    ),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),

          Expanded(
            child: Container(
              child: Column(
                children: [
                  TextField()
                ],
              ),
            ),
          ),

          // Bottom (고정 영역)
          Container(
            height: 75,
            decoration: BoxDecoration(
              // border: Border(
              //   top: BorderSide(color: Colors.grey.shade300, width: 1),
              // ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [



              ],
            ),
          ),




        ],
      )

    );
  }
}
