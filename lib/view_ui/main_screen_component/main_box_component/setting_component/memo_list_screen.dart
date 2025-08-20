
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';

import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../screen/calendar_screen/provider/show_memo_provider.dart';

class MemoListScreen extends HookConsumerWidget {
  const MemoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final selectedDate = ref.selected;
    final data = ref.history.value;

    final monthlyHistoriesWithMemo = data?.where((history) =>
    history.date.year == selectedDate.year &&
        history.date.month == selectedDate.month &&
        history.memo.isNotEmpty
    ).toList() ?? [];

    Decoration infoBoxDeco = BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey.shade700,
        width: 0.75,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
    );

    return Container(
      height: screenHeight > 750
          ? Platform.isAndroid ? screenHeight * 0.70 : screenHeight * 0.8
          : Platform.isAndroid ? screenHeight * 0.80 : screenHeight * 0.85,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 16.0, horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget(
                      '${ref.monthString}월 메모기록',
                      18, context.width),
                  Spacer(),
                  InkWell(
                    onTap: () => ref.read(showMemoStateProvider.notifier).memoState(),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 100,
                      height: 30,
                      child: TextWidget(
                        '돌아가기',
                        16,
                        context.width,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Colors.grey.shade300,
                  thickness: 2.5,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}