import 'package:calendar_project_240727/core/export_package.dart';


class DefaultScreen extends HookConsumerWidget {
  final Widget body;
  final List<Widget> buttom;

  const DefaultScreen({
    super.key,
    required this.body,
    required this.buttom,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: body,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LayoutBuilder(
        builder: (context, constraints) {
          // LayoutBuilder 안에서 안전하게 MediaQuery 사용
          final mediaQuery = MediaQuery.of(context);
          final appHeight = mediaQuery.size.height;
          final appWidth = mediaQuery.size.width;

          final double isSmall = Platform.isAndroid
              ? appHeight * 0.0125
              : appHeight * 0.0225;
          final double isBig = Platform.isAndroid
              ? appHeight * 0.008
              : appHeight * 0.028;

          return Transform.translate(
            offset: Offset(0, appWidth < 380 ? isSmall : isBig),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: buttom,
            ),
          );
        },
      ),
    );
  }




}


