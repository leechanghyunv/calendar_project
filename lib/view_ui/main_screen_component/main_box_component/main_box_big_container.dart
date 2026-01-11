import 'package:calendar_project_240727/base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../view_model/filted_instance_model/filted_month_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../screen/app_setting_screen/provider/animation_provider.dart';
import '../../screen/calendar_screen/provider/animation_text_provider.dart';
import 'component/animated_pay_number.dart';
import 'component/company_list_provider_text.dart';

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

    /// animationSetting의 타입은 AsyncValue<bool>
    final animationSetting = ref.watch(openingAnimationProvider).valueOrNull ?? false;

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;
    final commonShadow = Platform.isAndroid
        ? [Shadow(blurRadius: 0.25, color: Colors.grey, offset: Offset(0.25, 0.25))]
        : null;

    final appWidth = MediaQuery.of(context).size.width;

    final data = ref.watch(monthRecordProvider(ref.selected));

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
        fontSize: switch (appWidth) {
          > 450 => isFoldValue ? 37 : 40.5,
          > 420 => 40,
          > 400 => 38,
          < 376 => 31,
          _ => 32
        }
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


              // SizedBox(width: 5),
              //
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.teal.shade50,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              //     child: Row(
              //       children: [
              //         TextWidget(
              //             '일비포함',
              //             11, context.width,color: Colors.teal.shade500),
              //       ],
              //     ),
              //   ),
              // ),

            ],
          ),
        ),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              textScaler: TextScaler.noScaling,
              ' ${taxValue}, 세후 ${afterTax}',
                style: TextStyle(
                  letterSpacing: Platform.isAndroid && appWidth > 400 ? 1.0 : 0.5,
                    shadows: commonShadow,
                    fontWeight: FontWeight.bold,
                  fontSize : switch (appWidth) {
                    > 450 => isFoldValue ? 12 : 12.5,
                    > 400 => 12,
                    < 376 => 9.25,
                    _ => 10
                  },

                ),
            ),
          ],
        ),
        appWidth > 400 ? isFoldValue ? SizedBox(height: 0) : SizedBox(height: 5) : SizedBox(height: 0),

      ],
    );
  }
}


