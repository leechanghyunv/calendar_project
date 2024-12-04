import 'package:calendar_project_240727/repository/time/calendar_time_controll.dart';
import 'package:calendar_project_240727/view_model/calendar_event_model.dart';

import 'core/export_package.dart';

abstract class BaseConsumerWidget extends ConsumerStatefulWidget {



  Future<void> refresh(BuildContext context, WidgetRef ref) async {
    await Future.delayed(const Duration(milliseconds: 250), () {
      ref.refresh(calendarEventProvider);
      ref.read(timeManagerProvider.notifier).selectedNextDay();
      Navigator.pushReplacementNamed(context, '/main');
    });
  }


}