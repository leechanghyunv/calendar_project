import 'package:calendar_project_240727/base_app_size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_dialog_extenstion.dart';
import '../../calendar/calendar_widget.dart';
import '../../dialog/initial_launch_dialog/initial_launch_dialog.dart';


class CalendarScreen extends HookConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    useEffect(() {
      Future<void> checkFirstLaunch() async {
        final prefs = await SharedPreferences.getInstance();
        final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
        if (isFirstLaunch) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.dialog(InitialLaunchDialog());
          });
          await prefs.setBool('isFirstLaunch', false);
        }

      }
      checkFirstLaunch();
      return null;
    }, []);

    print('height: ${context.height} width: ${context.width}');



    return Scaffold(
      body: SingleChildScrollView(
        child: WorkCalendar(),
      ),
    );
  }
}
