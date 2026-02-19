
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_model/selected_memo_filter.dart';
import 'package:calendar_project_240727/view_ui/screen/search_chip_screen/provider/convert_memoChip_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/utils/converter.dart';
import '../../search_screen/search_screen.dart';
import 'animated_total.dart';

class FloatingRowComponent extends HookConsumerWidget {

  const FloatingRowComponent({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final filteredPay = ref.watch(filteredTotalPayProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: .center,
        children: [
          SizedBox(width: 7.5),
          if (filteredPay > 0)
            AnimatedTotal(
              end: filteredPay,
            ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 4.0
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      HapticFeedback.selectionClick();

                    },
                      child: Icon(MdiIcons.informationOutline,color: context.subTextColor)),
                  SizedBox(width: 20),
                  GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        ref.read(convertMemoChipProvider.notifier).convert();
                        customMsg('메인화면에 등록되었습니다');
                        Navigator.pop(context);
                      },
                      child: Icon(MdiIcons.refresh,color: context.subTextColor)),
                  SizedBox(width: 20),
                  GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        Navigator.pop(context);
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          context.showModal(
                            heightRatio: 0.85,
                            child: SearchScreen(),
                          );
                        });

                      },
                      child: Icon(MdiIcons.arrowTopRightThin,color: context.subTextColor)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
