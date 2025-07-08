import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/history_box_component/selected_history_box/selected_listView.dart';

import '../../../../../core/export_package.dart';
import '../../provider/statistic_switch_provider.dart';
import '../data_range_dialog/data_dialog.dart';
import '../filter_chip.dart';
import '../function_chip.dart';

class HistoryManagerComponent extends ConsumerWidget {
  const HistoryManagerComponent({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final switchAsync = ref.watch(switchNotifierProvider);
    final isOn = switchAsync.valueOrNull ?? false;
    final double height = MediaQuery.of(context).size.height;
    /// appWidth > 400 ? 370 : (appWidth < 376 ? 290 : 250)
    return Container(
      height: isOn
          ? 250
          : 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 4.0),
             child: Row(
               children: [
                 FilterHistoryChip(),
                 SizedBox(width: 10.0),
                 IconButton(
                   padding: EdgeInsets.zero,
                   constraints: BoxConstraints(),
                   splashRadius: 15.0,
                   onPressed: () {

                   },
                   icon: Icon(
                     Icons.add,
                     size: 20.0,
                     color: Colors.grey.shade600,
                   ),
                 ),
                 Spacer(),
                 FunctionChip(
                   label: '@검색',
                   color: isOn ? Colors.blue.shade100 : Colors.green.shade100,
                   borderColor: isOn ? Colors.blue.shade400 : Colors.green.shade400,
                   textColor: isOn ? Colors.blue.shade900 : Colors.green.shade900,

                   onTap: () {
                     showDialog(
                       context: context,
                       builder: (context) => DataDialog(),
                     );
                   },
                 ),

               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.symmetric(
                 vertical: height > 750 ? 3.0 : 0.0, horizontal: 8.0),
             child: Divider(color: Colors.grey.shade300, thickness: 1.0),
           ),

           Expanded(
             child: Container(
               child: SelectedListview(),
             ),
           ),
         ],
      ),
    );
  }
}
