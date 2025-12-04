import 'package:calendar_project_240727/base_app_size.dart';

import '../../../../base_consumer.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../view_model/view_provider/is_galaxy_fold.dart';
import '/../../core/export_package.dart';

class CompactDashboard extends ConsumerWidget {


  const CompactDashboard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final data = ref.history.value;
    final selectedDate = DateTime.utc(DateTime.now().year, ref.month, ref.day);

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;
    final commonShadow = Platform.isAndroid
        ? [Shadow(blurRadius: 0.25, color: Colors.grey, offset: Offset(0.25, 0.25))]
        : null;

    String hintValue() {
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

    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Container(
            // width: 150,
            decoration: BoxDecoration(
              color: context.bTypeChipColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Row(
              children: [
                Text(hintValue(),
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: context.subTextColor)),
              ],
            ),
          ),
          SizedBox(width: 5),

          // if (totalPay > 0.0)
          // Container(
          //   decoration: BoxDecoration(
          //     color: context.bTypeChipColor,
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(4.0),
          //     child: Text(
          //       textScaler: TextScaler.noScaling,
          //       '기흥 유창 메모입력',
          //       style: TextStyle(
          //           shadows: commonShadow,
          //           fontSize: switch (context.width) {
          //             > 450 => isFoldValue ? 11.5 : 13.5,
          //             > 400 => 11.5,
          //             _ => 11,
          //           },
          //           fontWeight: FontWeight.w700,
          //           color: context.textColor),
          //     ),
          //   ),
          // ),


        ],
      ),
    );
  }
}
