import 'package:calendar_project_240727/core/export_package.dart';


final scaffoldKeyProvider = Provider<GlobalKey<ScaffoldState>>((ref) {
  return GlobalKey<ScaffoldState>();
});

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

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final scaffoldKey = ref.watch(scaffoldKeyProvider);

    useEffect(() {
      if (Platform.isAndroid) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: isDark ? Colors.black : Colors.grey.shade50,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ));
      }
      return null;
    }, [isDark]);

    return Scaffold(
      // key: scaffoldKey,
      // endDrawer: SettingsDrawer(),
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


