import 'package:calendar_project_240727/base_consumer.dart';
import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../view_model/period_filter_model/monthly_filter_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../screen/app_setting_screen/provider/animation_provider.dart';
import '../../screen/calendar_screen/provider/animation_text_provider.dart';
import 'component/animated_pay_number.dart';
import 'component/company_list_provider_text.dart';
import 'size_module/main_box_sizes.dart';

class MainBoxBigContainer extends ConsumerStatefulWidget {
  const MainBoxBigContainer({super.key});

  @override
  ConsumerState<MainBoxBigContainer> createState() => _MainBoxBigContainerState();
}

class _MainBoxBigContainerState extends ConsumerState<MainBoxBigContainer> {

  String payString = '0.0만원';
  String taxValue = '세율 0.0%';
  String afterTax = '세후 0.0만원';
  String percent = '0.0%';
  double totalPay = 0.0;
  String totalPayAnd = '0.0만원';

  @override
  Widget build(BuildContext context) {
    final animateText = ref.watch(animationTextProviderProvider);

    final animationSetting = ref.watch(openingAnimationProvider).valueOrNull ?? false;

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFlip = ref.watch(isGalaxyFlipProvider);
    final isFoldValue = isFold.asData?.value ?? false;
    final isFlipValue = isFlip.asData?.value ?? false;
    final commonShadow = Platform.isAndroid
        ? [Shadow(blurRadius: 0.25, color: Colors.grey, offset: Offset(0.25, 0.25))]
        : null;

    final appWidth = context.width;

    final data = ref.watch(monthRecordProvider(ref.selected));

    final boxSizes = MainBoxSizes(
      width: appWidth,
      isFold: isFoldValue,
      isFlip: isFlipValue,

    );

    data.whenData((val) {
      totalPay = (val.totalPay/10000);
      payString = val.totalPayString;
      afterTax = val.afterTax;
      taxValue = val.tax;
      percent = val.percent;
      totalPayAnd = val.totalPayAnd;

    });

    final BigTextStyle = TextStyle(
        shadows: commonShadow,
        fontWeight: FontWeight.w800,
        letterSpacing: Platform.isAndroid && appWidth > 400 ? 1.5 : null,
        height: textHeight,
        fontSize: boxSizes.bigFontSize + 1.5,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CompanyListProviderText(),

        Tooltip(
          message: '일비포함: ${totalPayAnd}',
          textStyle: TextStyle(fontWeight: FontWeight.bold),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              animationSetting ? animateText
                  ? PayNumberCounter(end: totalPay.toDouble())
                  : Text(
                textScaler: TextScaler.noScaling,
                '${payString}',
                  style: BigTextStyle,
              ) : Text(
                textScaler: TextScaler.noScaling,
                '${payString}',
                style: BigTextStyle,
              ),


            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.0 , horizontal: Platform.isAndroid ? 3.0 : 6.0),
                      child: totalPay == 0 ? Text('세후금액 상세히 보기',
                        style: TextStyle(
                          color: context.subTextColor,
                          letterSpacing: Platform.isAndroid && appWidth > 400 ? 1.0 : 0.5,
                          shadows: commonShadow,
                          fontWeight: FontWeight.bold,
                          fontSize : boxSizes.subFontSize,
                        ),
                      ) :
                      Text.rich(
                        textScaler: TextScaler.noScaling,
                        TextSpan(
                          style: TextStyle(
                            color: context.subTextColor,
                            letterSpacing: Platform.isAndroid && appWidth > 400 ? 1.0 : 0.5,
                            shadows: commonShadow,
                            fontWeight: FontWeight.bold,
                            fontSize: boxSizes.subFontSize,
                          ),
                          children: [

                             TextSpan(text: "세후금액 "),
                            TextSpan(
                              text: "$afterTax",
                              style: TextStyle(
                                  color: context.isLight ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,

                              ), // 👈 원하는 색상
                            ),
                             TextSpan(text: " 입니다"),
                          ],
                        ),
                      ),

                    ),
                  ),
              ],
            ),



          ],
        ),
        appWidth > 400 ? isFoldValue ? SizedBox(height: 0) : SizedBox(height: 2.5) : SizedBox(height: 0),

      ],
    );
  }
}


