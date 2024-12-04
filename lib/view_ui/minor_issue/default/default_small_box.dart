import 'package:calendar_project_240727/core/export_package.dart';


class DefaultSmallBox extends StatelessWidget {

  final Widget? child;

  const DefaultSmallBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;
    double getWidth(double appWidth) {
      if (appWidth > 500) return 180.w/2;
      if (appWidth <= 370) return 175.w;
      return 175.w;
    }


    return Container(
      alignment: Alignment.center,
      color: Colors.grey[300],
      width: getWidth(appWidth),
      height: 85.h,
      child: child,
    );
  }
}
