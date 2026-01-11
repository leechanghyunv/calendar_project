import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/modal_extension.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/loading_screen.dart';

import '../provider/modal_page_provider.dart';
import '../range_calendar_screen.dart';
import '../range_history_screen.dart';

final modalLoadingProvider = StateProvider<bool>((ref) => false);


void showRangeModal(BuildContext context,WidgetRef ref){
  context.showModal(
    heightBuilder: (h) => h > 750 ? h * 0.825 : h * 0.85,
    backgroundColor: Colors.grey.shade900,
    child: Consumer(
      builder: (context, ref, child){
        final currentPage = ref.watch(modalPageNotifierProvider);
        final isLoading = ref.watch(modalLoadingProvider);

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          child: isLoading ? LoadingScreen() : currentPage == 0
              ? RangeCalendarScreen(
                 () async {
                   ref.read(modalLoadingProvider.notifier).state = true;
                   await Future.delayed(Duration(milliseconds: 2000));
                   ref.read(modalPageNotifierProvider.notifier).setPage(1);
                   ref.read(modalLoadingProvider.notifier).state = false;
                },
              )
              : RangeHistoryScreen(),
        );
      }
    ),
  );
}