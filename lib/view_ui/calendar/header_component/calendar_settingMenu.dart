import 'package:calendar_project_240727/base_app_size.dart';
import '../../screen/app_setting_screen/setting_modal.dart';
import '/core/export_package.dart';

class SettingPopupWidget extends ConsumerWidget {
  const SettingPopupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appWidth = context.width;

    return IconButton(
      onPressed: () => showSettingModal(context),
      icon: Icon(
        Icons.menu,
        size: appWidth >= 450
            ? 30
            : appWidth > 400
            ? 27
            : 25,
      ),
    );
  }
}

