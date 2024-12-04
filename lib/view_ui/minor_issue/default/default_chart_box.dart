import 'package:calendar_project_240727/core/export_package.dart';
import '../../../repository/time/calendar_time_controll.dart';


class CartBox extends ConsumerWidget {

  final Widget? child;

  const CartBox({super.key, this.child});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final double appHeight = MediaQuery.of(context).size.height;
    final double appWidth = MediaQuery.of(context).size.width;
    final selecter = ref.watch(timeManagerProvider.notifier).shouldEnlarge();
    final double androidHeight = selecter ? appHeight * 0.275 : appHeight * 0.28;
    final double reactiveHeight = Platform.isAndroid
        ? androidHeight
        : appHeight > 900 ? appHeight * 0.285 : appHeight > 800 ? appHeight * 0.28 : appHeight * 0.27;


    return Padding(
      padding: EdgeInsets.fromLTRB
        (appWidth > 500 ? 4.w : 8.w,
          0,
          appWidth > 500 ? 4.w : 8.w,
          0),
      child: Container(
        alignment: Alignment.center,
        width: appWidth > 500 ? appWidth/2 : appWidth,

        height: appHeight < 700

            ? Platform.isAndroid ? appHeight * 0.34 : appHeight * 0.305

            : reactiveHeight,

        color: Colors.grey[300],


        child: child,
      ),
    );
  }
}