import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/repository/time/date_range_controller.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/loading_screen.dart';

import '../provider/modal_page_provider.dart';
import '../range_calendar_screen.dart';
import '../range_history_screen.dart';

final modalLoadingProvider = StateProvider<bool>((ref) => false);


void showRangeModal(BuildContext context,WidgetRef ref){

  final height = MediaQuery.of(context).size.height;

  showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    backgroundColor: Colors.grey.shade900,
    context: context,
    isDismissible: true,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      final screenHeight = MediaQuery.of(context).size.height;
      return Consumer(
          builder: (context, ref, child){
        final currentPage = ref.watch(modalPageNotifierProvider);
        final isLoading = ref.watch(modalLoadingProvider);
        final  selected = ref.watch(rangeSelectManagerProvider);
        return Container(
          height: height > 750
              ? screenHeight * 0.7
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
                child: AnimatedSwitcher(
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
                ),




              ),
            ],
          ),
        );
      });


    },
  );

}