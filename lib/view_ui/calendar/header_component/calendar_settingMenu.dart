import 'package:calendar_project_240727/base_app_size.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../screen/app_setting_screen/app_setting_screen.dart';
import '/core/export_package.dart';
import 'header_size.dart';

class SettingPopupWidget extends ConsumerWidget {
  const SettingPopupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final sizes = HeaderSizes(context.width);

    void showSettingModal(BuildContext context){
      context.showModal(
        heightRatio: 0.9,
        child: AppSettingScreen(),
      );
    }

    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: () => showSettingModal(context),
      icon: Icon(
        MdiIcons.sortVariant,
        size: sizes.settingIcon,
      ),
    );
  }
}

