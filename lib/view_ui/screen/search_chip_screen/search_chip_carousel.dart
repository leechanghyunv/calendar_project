
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_ui/screen/search_chip_screen/search_chip_screen.dart';
import 'package:intl/intl.dart';

import '../../../core/export_package.dart';

class CalendarPageView extends HookConsumerWidget {
  const CalendarPageView({super.key});

  static const int _initialPage = 1000;

  static DateTime _getMonth(DateTime base, int page) {
    final offset = page - _initialPage;
    return DateTime(base.year, base.month + offset, 1);
  }

  void _onMonthChange(VoidCallback moveMonth) {
    HapticFeedback.selectionClick();
    moveMonth();
  }

  /// _onMonthChange(ref.timeNot.movePreviousMonth)
  /// _onMonthChange(ref.timeNot.moveNextMonth),

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController(initialPage: _initialPage);

    return Column(
      children: [
        // 헤더 (월 표시 + 화살표)
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     IconButton(
        //       icon: Icon(Icons.chevron_left),
        //       onPressed: () {
        //         _onMonthChange(ref.timeNot.movePreviousMonth);
        //         controller.previousPage(
        //           duration: Duration(milliseconds: 300),
        //           curve: Curves.ease,
        //         );
        //       },
        //     ),
        //     Text(DateFormat('yyyy년 MM월').format(ref.selected)),
        //     IconButton(
        //       icon: Icon(Icons.chevron_right),
        //       onPressed: (){
        //         _onMonthChange(ref.timeNot.moveNextMonth);
        //         controller.nextPage(
        //           duration: Duration(milliseconds: 300),
        //           curve: Curves.ease,
        //         );
        //       },
        //     ),
        //   ],
        // ),

        // PageView
        Expanded(
          child: PageView.builder(
            controller: controller,
            onPageChanged: (page) {
              final next = _getMonth(ref.selected, page);
              // ref.timeNot.carouselPageChanged(next);
            },
            itemBuilder: (context, index) => const SearchChipScreen(),
          ),
        ),
      ],
    );
  }
}