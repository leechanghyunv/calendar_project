import 'package:calendar_project_240727/core/export.dart';


class CartBox extends StatelessWidget {

  final Widget? child;

  const CartBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {

    final double appHeight = MediaQuery.of(context).size.height;
    final double appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB
        (appWidth > 500 ? 4.w : 8.w,
          0,
          appWidth > 500 ? 4.w : 8.w,
          0),
      child: Container(

        width: appWidth > 500 ? appWidth/2 : appWidth,

        height: appHeight < 700

            ? Platform.isAndroid
            ? appHeight * 0.34
            : appHeight * 0.29

            :  appHeight * 0.27,
        color: Colors.grey[300],
        child: child,
      ),
    );
  }
}