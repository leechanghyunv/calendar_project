import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import '../../view_model/view_provider/is_galaxy_fold.dart';
import '../extentions/theme_color.dart';

class TextWidget extends ConsumerWidget {
  final String msg;
  final double size;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;

  const TextWidget(
      this.msg,
      this.size, {
        super.key,
        this.color,
        this.fontWeight, this.maxLines = 3,
      });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;

    return Text(
      msg,
      textScaler: TextScaler.noScaling,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.bold,
        height: textHeight,
        color: color,
        fontSize: _getFontSize(
            size, context.width,isFoldValue),
        letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
      ),
    );
  }
}



double _getFontSize(double baseSize, double appWidth,bool isFold) {
  return switch (appWidth) {
     >= 450 => isFold ? baseSize - 1.5 : baseSize + 1.5, // 매우 큰 화면 (초대형 안드로이드 등)
    >= 420 => baseSize + 1.25, // 아이폰 Pro Max 등 대화면
    >= 410 => baseSize + 1.0, // 일반적인 대형 화면
    >= 400 => baseSize + 0.5, // 일반적인 대형 화면
    >= 390 => baseSize , // 일반적인 대형 화면
    >= 375 => baseSize - 1.5, // 작은 화면 (디스플레이 확대 모드 활성화 포함)
    >= 350 => baseSize - 2.5, // 작은 화면 (디스플레이 확대 모드 활성화 포함)
    _ => isFold ? baseSize - 2.0 : baseSize - 3.0, // 기본값
  };
}


Widget dayText(String day) {
  return Consumer(builder: (context,ref,_){
      final isLight = context.isLight;

      final isFold = ref.watch(isGalaxyFoldProvider);
      final isFoldValue = isFold.asData?.value ?? false;


      return  Text(day,
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            height: textHeight,
            fontSize: switch (context.width) {
              >= 450 => isFoldValue ? 16.5 : 20.5,
              >= 420 => 19.5,
              >= 410 => 19.5,
              >= 400 => 18.5,
              >= 390 => 17.5,
              >= 375 => 16.5,
              >= 350 => 15.5,
              _ => 14.5,
            },
            color: day == '토'
                ? context.saturdayColor
                : day == '일'
                ? context.sundayColor
                : isLight ? Colors.black : Colors.white,
            fontWeight: FontWeight.w700,
          )
      );
    },

  );
}
