
import 'package:calendar_project_240727/core/export_package.dart';

class PieChartNumericTextBox extends StatelessWidget {

  final List<Widget> children;

  const PieChartNumericTextBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          appWidth > 500 ? 7.w : 14.w,
          8.h,
          appWidth > 500 ? 3.5.w : 3.0.w,
          0),
      child: Container(
        // color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
