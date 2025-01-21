
import 'package:calendar_project_240727/view_ui/calendar/range_picker_component/range_view_container.dart';

import '../../../core/export_package.dart';

class ContainerBox extends StatelessWidget {

  final List<Widget> children;

  const ContainerBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    return Container(
      width: appWidth,
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 12.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

class ContainerComponent extends StatelessWidget {

  final String value;

  const ContainerComponent({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6.0),
      ),
      width: appWidth,
      height: 125,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            MiddleTitle(),
            const SizedBox(height: 5),
            Spacer(),
            TotalValue(value,appWidth),
            taxSettingBox(),
            Spacer(),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

Widget TotalValue(String value,double width) => Padding(
  padding: const EdgeInsets.all(4.0),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        value,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontSize: width > 400 ? 28 : 26,
        ),
      ),
    ],
  ),
);
