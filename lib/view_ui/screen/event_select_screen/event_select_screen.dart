import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import '../../../../core/export_package.dart';
import '../../../model/event/custom_event.dart';
import '../../../view_model/sqlite_model/event_model.dart';
import '../../widgets/duration_select_module.dart';
import '../../widgets/elevated_button.dart';
import 'component/day_select_textfield.dart';
import 'component/event_textfield.dart';
import 'package:intl/intl.dart';

class EventSelectScreen extends HookConsumerWidget {
  const EventSelectScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final focusNode = useFocusNode();
    final controller = useTextEditingController();

    final DayFocusNode = useFocusNode();
    final DayController = useTextEditingController();

    final isDuration = useState(false);
    final selectedDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());

    useListenable(controller);

    String getGuideText() {
      final text = controller.text.trim();

      if (isDuration.value) {
        if (text.isEmpty) {
          return '일정을 입력해주세요';
        }
        return '"$text"의 내용으로 저장합니다';
      } else {
        final dateStr = DateFormat('yyyy년 MM월 dd일').format(selectedDate.value);
        if (text.isEmpty) {
          return '$dateStr에 일정을 입력해주세요';
        }
        return '$dateStr을 "$text"의 내용으로 저장합니다';
      }
    }

    final monthDifference = useMemoized(
          () {
        final start = selectedDate.value;
        final end = endDate.value;

        return (end.year - start.year) * 12 + (end.month - start.month);
      },
      [selectedDate.value, endDate.value],
    );

    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, []);

    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15),
                Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),

                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: EventTextField(
                                            focusNode: focusNode,
                                            controller: controller,
                                          
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                              onTap: () => controller.clear(),
                                              child: Icon(Icons.close,
                                                  color: context.subTextColor,
                                              ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          DurationSelectModule(
                                            focusNode: focusNode,
                                            isDuration: isDuration,
                                            selectedDate: selectedDate,
                                            endDate: endDate,
                                          ),
                                          SizedBox(height: 10),
                                          if (isDuration.value)
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                TextWidget(
                                                    '${monthDifference}개월 간 매월',
                                                    13.5,
                                                    context.width,
                                                    color: context.subTextColor
                                                ),
                                                SizedBox(width: 5),
                                                DaySelectTextField(
                                                  DayFocusNode: DayFocusNode,
                                                  DayController: DayController,

                                                ),
                                                SizedBox(width: 5),
                                                Expanded(
                                                  child: TextWidget(
                                                      getGuideText(),
                                                      13.5,
                                                      context.width,
                                                      color: context.subTextColor
                                                  ),
                                                ),
                                              ],
                                            )
                                          else
                                            TextWidget(
                                                getGuideText(),
                                                13.5,
                                                context.width,
                                                color: context.subTextColor
                                            ),
                                        ],
                                      ),
                                    ),

                                    Spacer(),

                                  ],
                                ),
                              ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomElevatedButton(
                                  text: '등록하기',
                                  onPressed: () async {
                                    final text = controller.text.trim();

                                    if (text.isEmpty) {
                                      customMsg('일정 내용을 입력해주세요');
                                      return;
                                    }

                                    if (isDuration.value){
                                      await ref.read(eventViewModelProvider.notifier).addMonthlyEvents(
                                        startDate: selectedDate.value,
                                        endDate: endDate.value,
                                        day: DayController.text,
                                        name: text,
                                      );
                                    } else {
                                      await ref.read(eventViewModelProvider.notifier).addEvent(
                                        CustomEvent(
                                          date: selectedDate.value,
                                          name: text,
                                        ),
                                      );
                                    }

                                    Navigator.pop(context);
                                    HapticFeedback.selectionClick();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                ),
              ],
            ),
          ),

        ),
    );
  }
}
