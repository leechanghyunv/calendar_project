
import '../../../../core/export_package.dart';
import '../../../../theme_color.dart';
import '../../../../view_model/view_provider/is_galaxy_fold.dart';

class PayNumberCounter extends ConsumerWidget {
  final double start;
  final double end;
  final Duration duration;

  const PayNumberCounter({
    super.key,
    this.start = 0,
    required this.end,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;

    final appWidth = MediaQuery.of(context).size.width;

    final commonShadow = Platform.isAndroid
        ? [Shadow(blurRadius: 0.25, color: Colors.grey, offset: Offset(0.25, 0.25))]
        : null;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: start, end: end),
      duration: duration,
      builder: (context, value, child) {
        return Text(
          textScaler: TextScaler.noScaling,
          '${value.toStringAsFixed(1)}만원', // 정수 형태
          style: TextStyle(
              shadows: commonShadow,
              fontWeight: FontWeight.w800,
              letterSpacing: Platform.isAndroid && appWidth > 400 ? 1.5 : null,
              height: textHeight,
              fontSize : switch (appWidth) {
                > 450 => isFoldValue ? 37 : 40.5,
                > 400 => 37,
                < 376 => 31.5,
                _ => 32
              }

          ),
        );
      },
    );
  }
}