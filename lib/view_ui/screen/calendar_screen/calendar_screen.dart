import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/export_package.dart';
import '../../calendar/calendar_widget.dart';
import '../../dialog/initial_launch_dialog/initial_launch_dialog.dart';


class CalendarScreen extends HookConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;

    useEffect(() {
      Future<void> checkFirstLaunch() async {
        final prefs = await SharedPreferences.getInstance();
        final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
        if (isFirstLaunch) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
                context: context,
                builder: (context) => InitialLaunchDialog()
            );
          });
          await prefs.setBool('isFirstLaunch', false);
        }
      }

      checkFirstLaunch();
      return null;
    }, []);



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
