import 'package:calendar_project_240727/base_app_size.dart';

import '../../../core/export_package.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../main_box_component/main_box_sizes.dart';

class SearchChipBox extends HookConsumerWidget {
  const SearchChipBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;

    final boxSizes = MainBoxSizes(
      width: context.width,
      isFold: isFoldValue,
    );

    return Container(
      height: boxSizes.chartBoxHeight,
      child: Column(
        children: [

        ],
      ),
    );
  }
}
