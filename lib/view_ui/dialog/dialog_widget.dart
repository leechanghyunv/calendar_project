import '../../core/export_package.dart';

class AnimationDecoration extends StatelessWidget {
  const AnimationDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appWidth > 370 ? 12.0 : 6.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.black, size: appWidth > 370 ? 20.0 : 15.0),
    );
  }
}

