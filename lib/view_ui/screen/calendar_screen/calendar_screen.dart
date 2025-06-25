import '../../../core/export_package.dart';
import '../../../view_model/view_provider/calendar_switcher_model.dart';
import '../../calendar/calendar_widget.dart';


class CalendarScreen extends HookConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Platform.isAndroid ? const SizedBox(height: 1.0) :
        SizedBox(
          height: switch (appWidth) {
            < 376 => 0.0,
            > 500 => 10.0,
            _ => 25.0,
          },
        ),
        WorkCalendar(),

      ],

    );
  }
}
