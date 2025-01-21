
import 'package:calendar_project_240727/base_consumer.dart';

import '../../../core/export_package.dart';
import '../../../core/utils/converter.dart';
import '../../../view_model/filted_source_model.dart';
import '../../../view_model/instance_provider_model/work_day_provider.dart';

class MainBoxBigContainer extends ConsumerStatefulWidget {
  const MainBoxBigContainer({super.key});

  @override
  ConsumerState<MainBoxBigContainer> createState() => _MainBoxBigContainerState();
}

class _MainBoxBigContainerState extends ConsumerState<MainBoxBigContainer> {

  int payRecord = 0;
  int prevRecord = 0;
  double taxValue = 0;
  double afterTax = 0;


  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    ref.watch(numericSourceModelProvider(ref.selected));
    final monthPayAsync = ref.watch(monthPayProvider);
    final prevPayRecord = ref.watch(prevMonthPayProvider);

    prevPayRecord.when(data: (val){
      prevRecord = val;
    }, error: (err,trace){}, loading: (){});

    monthPayAsync.when(data: (val){
      payRecord = val.payValue;
      afterTax = val.afterTaxValue;
      taxValue = val.taxValue;
    }, error: (err,trace){}, loading: (){});


    String calculateDisplayValue(int current, int previous) {
      if (previous == 0 || current == 0) return '0.0';

      final percentage = ((current - previous) / previous) * 100;

      if (percentage.isInfinite) return '100.0';
      if (percentage.isNaN) return '0.0';

      return percentage.toStringAsFixed(1);
    }

    final displayValue = calculateDisplayValue(payRecord, prevRecord);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(' ${ref.selected.year}년 ${ref.selected.month}월 급여',
                style: TextStyle(
                    letterSpacing: Platform.isAndroid && appWidth > 400 ? 1.5 : null,

                    height: Platform.isAndroid ? 1.2 : null,
                  color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,

                  fontSize: switch (appWidth) {
                    > 450 => 15,
                    > 420 => 14.5,
                    > 400 => 14,
                    _ => 12,
                  },

                )),
            SizedBox(width: 10),
          ],
        ),

        Row(
          children: [
            Text('${formatAmount(payRecord)}',
                style: TextStyle(
                    shadows: Platform.isAndroid ? [
                      Shadow(
                        blurRadius: 0.75,
                        color: Colors.grey,
                        offset: Offset(0.25, 0.25),
                      ),
                    ] : null,
                    fontWeight: Platform.isAndroid ? FontWeight.w900 : FontWeight.bold,
                    letterSpacing: Platform.isAndroid && appWidth > 400 ? 2.5 : null,
                    height: Platform.isAndroid ? 1.2 : null,

                    fontSize: appWidth > 400
                        ? 36
                        : (appWidth < 376 ? 30 : 32),

                ),
            ),

            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '${displayValue}%',
                  style: TextStyle(
                      shadows: Platform.isAndroid ? [
                        Shadow(
                          blurRadius: 0.75,
                          color: Colors.grey,
                          offset: Offset(0.25, 0.25),
                        ),
                      ] : null,

                      fontSize: switch (appWidth) {
                        > 450 => 13,
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
            Text(' 세율 ${taxValue}%, 세후 ${formatAmount(afterTax.toInt())}',
                style: TextStyle(

                    shadows: Platform.isAndroid ? [
                      Shadow(
                        blurRadius: 0.25,
                        color: Colors.grey,
                        offset: Offset(0.15, 0.15),
                      ),
                    ] : null,
                    fontWeight: FontWeight.bold,
                    fontSize: appWidth > 400
                        ? 12
                        : (appWidth < 376 ? 9 : 10),
                  letterSpacing: Platform.isAndroid && appWidth > 400 ? 1.25 : 0.5,
                ),
            ),
          ],
        ),
      ],
    );
  }
}
