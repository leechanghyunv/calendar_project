import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/modal_extension.dart';
import '../../screen/search_screen/search_screen.dart';
import '/core/export_package.dart';
import 'header_size.dart';

class PopupWidget extends ConsumerWidget {
  const PopupWidget( {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = context.width;
    final sizes = HeaderSizes(context.width);

    return IconButton(
      onPressed: () => context.showModal(
        heightRatio: 0.88,
        child: SearchScreen(),
      ),
      icon: Icon(
        Icons.calendar_today_outlined,
        size: sizes.calendarIcon,
        // color: Colors.grey.shade900,
      ),
    );
  }
}
