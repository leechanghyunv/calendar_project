
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../auth_screen/const_widget.dart';

class StatisticsFilterModal extends HookConsumerWidget {
  const StatisticsFilterModal({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return InfoRow(
      title: '현장별 평균일당',
      subtitle: '등록된 공수를 기반으로 통계를 보여드립니다.',
      trailing: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            // Icon(Icons.notifications_none_outlined,color: Colors.grey.shade700,size: 25),
            // SizedBox(width: 15),
            Icon(MdiIcons.tuneVariant, size: 22),
            SizedBox(width: 2.5),
          ],
        ),
      ),
    );
  }
}
