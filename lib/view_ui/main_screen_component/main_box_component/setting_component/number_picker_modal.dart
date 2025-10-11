import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/main_screen_component/main_box_component/setting_component/setting_screen.dart';
import '../../../../core/export_package.dart';
import '../../../screen/calendar_screen/provider/show_memo_provider.dart';
import 'memo_list_screen.dart';


void NumberPickerModal(BuildContext context){
  showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        side: context.isDark ? BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ) : BorderSide.none,
      ),
      builder: (BuildContext context) {
        final screenHeight = context.height;
        return Container(
          height: screenHeight > 750
              ? screenHeight * 0.8
              : screenHeight * 0.85,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 30,
                height: 4,
                margin: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: Consumer(
                    builder: (context, ref, child){
                      final memoState = ref.watch(showMemoStateProvider);
                      return memoState
                          ? MemoListScreen()
                          : SettingScreen();
                    }),
              ),
            ],
          ),
        );
      }

  );
}