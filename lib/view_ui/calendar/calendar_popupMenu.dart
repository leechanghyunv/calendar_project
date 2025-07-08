import 'package:calendar_project_240727/base_consumer.dart';
import '../../core/export_package.dart';

class PopupWidget extends ConsumerWidget {


  const PopupWidget( {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;

    return PopupMenuButton<int>(
      child: IconButton(
        onPressed: null,
        icon: Icon(
          Icons.calendar_today_outlined,
          size: appWidth >= 450 ? 27.5 : appWidth > 400 ? 25 : 22.5,
          color: Colors.grey.shade800,
        ),
      ),
      offset: const Offset(35, 35),
      itemBuilder: (context){
        return List.generate(
            7,
                (index){
              return PopupMenuItem(
                value: index + 1,
                child: Row(
                  children: [
                    Text(
                      ref.timeNot.getFormattedDate(ref.year, ref.month - (index + 1)),
                      textScaler: TextScaler.noScaling,
                      style: TextStyle(
                        fontSize: appWidth > 450 ? 16 : 13,
                        fontWeight: Platform.isAndroid ? FontWeight.w600 : FontWeight.w900,
                      ),
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
