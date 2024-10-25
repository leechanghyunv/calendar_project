import 'package:calendar_project_240727/core/export.dart';


class DefaultInfobox extends StatelessWidget {

  final List<Widget> children;

  const DefaultInfobox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0.w),
      child: Container(
        width: appWidth > 500 ? appWidth/2.05 : appWidth,

        height: appHeight < 700
                       /// size.width * 0.80 /// size.height * 0.45
            ? MediaQuery.of(context).size.height * 0.47
                       /// size.width * 0.950 /// size.height * 0.44
            : MediaQuery.of(context).size.height * 0.444,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Colors.grey[300],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
