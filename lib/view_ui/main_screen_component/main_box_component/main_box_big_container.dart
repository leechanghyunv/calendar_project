import 'package:calendar_project_240727/base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../theme_color.dart';
import '../../../view_model/filted_instance_model/filted_month_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../screen/calendar_screen/provider/animation_text_provider.dart';
import 'component/animated_pay_number.dart';

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

  @override
  Widget build(BuildContext context) {
    final animateText = ref.watch(animationTextProviderProvider);
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

    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectedTime(),
        Row(
          children: [
            animateText
                ? PayNumberCounter(end: totalPay.toDouble())
                : Text(
              textScaler: TextScaler.noScaling,
              '${payString}',
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
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  textScaler: TextScaler.noScaling,
                  '${percent}',
                  style: TextStyle(
                      shadows: commonShadow,
                      fontSize: switch (appWidth) {
                        > 450 => isFoldValue ? 12 : 15,
                        > 400 => 12,
                        _ => 11,
                      },
                      fontWeight: FontWeight.w700,
                      color: Colors.green.shade800),
                ),
              ),

            ),

          ],
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
                    > 400 => isFoldValue ? 12 : 12.5,
                    > 400 => 12,
                    < 376 => 9.25,
                    _ => 10
                  },

                ),
            ),
          ],
        ),
        appWidth > 400 ? isFoldValue ? SizedBox(height: 0) : SizedBox(height: 10) : SizedBox(height: 0),

      ],
    );
  }
}


class SelectedTime extends ConsumerWidget {
  const SelectedTime({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    String hintValue() {
      final data = ref.history.value;

      final selectedDate = DateTime.utc(DateTime.now().year, ref.month, ref.day);

      try{
        final existingMemo = data
            ?.where((e) =>
        e.date.year == selectedDate.year &&
            e.date.month == selectedDate.month &&
            e.date.day == selectedDate.day)
            .firstOrNull
            ?.memo;

        return existingMemo?.isNotEmpty ?? false
            ? ' ${existingMemo}'
            : ' ${ref.selected.year}년 ${ref.selected.month}월 급여';
      }catch(e){
        return ' ${ref.selected.year}년 ${ref.selected.month}월 급여';
      }
    }

    final appWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Text(
            textScaler: TextScaler.noScaling,
            hintValue(),
            style: TextStyle(
              letterSpacing: Platform.isAndroid && appWidth > 400 ? 1.0 : null,
              height: textHeight,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              fontSize: switch (appWidth) {
                > 450 => 14,
                > 400 => 13,
                _ => 12,
              },

            )),
        SizedBox(width: 10),
      ],
    );
  }
}
