import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/modal_extension.dart';
import '../../screen/search_chip_screen/search_chip_screen.dart';
import '../../screen/search_screen/search_screen.dart';
import '/core/export_package.dart';
import 'header_size.dart';

class PopupWidget extends ConsumerWidget {
  const PopupWidget( {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final sizes = HeaderSizes(context.width);

    return IconButton(
      onPressed: () => context.memoChipModal(
        heightRatio: 0.46,
        // child: SearchScreen(),
        child: SearchChipScreen(),
      ),
      icon: Icon(
        Icons.calendar_today_outlined,
        size: sizes.calendarIcon,
        // color: Colors.grey.shade900,
      ),
    );
  }
}
