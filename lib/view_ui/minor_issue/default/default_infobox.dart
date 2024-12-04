import 'package:calendar_project_240727/core/export_package.dart';
import '../../../repository/time/calendar_time_controll.dart';


class DefaultInfobox extends StatelessWidget {

  final List<Widget> children;

  const DefaultInfobox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0.w),
      child: Consumer(
          builder: (context,ref,child){
            final selecter = ref.watch(timeManagerProvider.notifier).shouldEnlarge();

            final double androidHeight = selecter ? appHeight * 0.444 : appHeight * 0.433;

            final double reactiveHeight = Platform.isAndroid ?  appHeight * 0.454 : appHeight * 0.444;

            double normalHeight = selecter ? androidHeight : reactiveHeight;

            return Container(
              width: appWidth > 500 ? appWidth/2.0 : appWidth,

              height: appHeight < 700
                  ? selecter ? appHeight * 0.466 : appHeight * 0.475 /// se인 경우
                  : normalHeight,



              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                color: Colors.grey[300],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: children,
              ),
            );
          }),



    );
  }
}
