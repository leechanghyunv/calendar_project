import 'package:calendar_project_240727/core/export.dart';


class DefaultSmallBox extends StatelessWidget {

  final Widget? child;

  const DefaultSmallBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      color: Colors.grey[300],
      width: appWidth > 500 ? 180.w/2 : 167.w,
      height: 85.h,
      child: child,
    );
  }
}
