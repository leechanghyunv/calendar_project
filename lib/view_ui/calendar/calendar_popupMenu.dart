import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_model/instance_provider_model/chart_value_provider.dart';

import '../../core/export_package.dart';

class PopupWidget extends ConsumerWidget {
  const PopupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;

    return PopupMenuButton<int>(
      icon: Icon(
          Icons.calendar_today_outlined,
          size: appWidth > 400 ? 25 : 20
      ),
      itemBuilder: (context){
        return List.generate(
          10,
              (index){
                final targetDate = DateTime(ref.year, ref.month - (index + 1));
                final record = ref.watch(lineValueProvider(targetDate));
            return PopupMenuItem(
              value: index + 1,
              child: Row(
                children: [
                  Text(
                    ref.timeNot.getFormattedDate(ref.year, ref.month - (index + 1)),
                    style:  TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900),
                  ),


                ],
              ),
            );
              }
        );
      },
      onSelected: (value) => ref.timeNot.moveMonth(value),
    );
  }
}
