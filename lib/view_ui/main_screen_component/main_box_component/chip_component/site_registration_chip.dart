import 'package:calendar_project_240727/base_app_size.dart';

import '../../../../base_consumer.dart';
import '../../../../core/extentions/theme_color.dart';
import '/../../core/export_package.dart';

class CompactDashboard extends ConsumerWidget {


  const CompactDashboard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final data = ref.history.value;
    final selectedDate = DateTime.utc(DateTime.now().year, ref.month, ref.day);


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
        ],
      ),
    );
  }
}
