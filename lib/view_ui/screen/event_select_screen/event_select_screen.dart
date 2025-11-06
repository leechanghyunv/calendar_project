import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import '../../../../core/export_package.dart';
import '../../widgets/elevated_button.dart';
import 'component/day_select_textfield.dart';
import 'component/event_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class EventSelectScreen extends HookConsumerWidget {
  const EventSelectScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final focusNode = useFocusNode();
    final controller = useTextEditingController();

    final DayFocusNode = useFocusNode();
    final DayController = useTextEditingController();

    // final eventType = ref.watch(eventTypeProvider.notifier);
    // final eventTypeState = ref.watch(eventTypeProvider);

    final isDuration = useState(false);
    final showPicker = useState(false);
    final isSelectingEndDate = useState(false);
    final selectedDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());

    useListenable(controller);

    String formatDate(DateTime date) {
      final weekdays = ['월', '화', '수', '목', '금', '토', '일'];
      final weekday = weekdays[date.weekday - 1];
      return '${date.year.toString().substring(2)}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}($weekday)';
    }

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
                                          Divider(
                                            color: Theme.of(context).dividerColor,
                                            thickness: 1,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              Icon(Icons.access_time,color: context.subTextColor),
                                              SizedBox(width: 15),
                                              TextWidget(
                                                  isDuration.value ? '기간 선택' : '날짜 선택', 15, context.width,
                                              color: context.subTextColor),
                                              Spacer(),
                                              Switch(
                                                value: isDuration.value,
                                                onChanged: (bool val){
                                                  isDuration.value = !isDuration.value;
                                                  HapticFeedback.selectionClick();
                                                },
                                                activeThumbColor: Colors.teal,
                                              ),

                                            ],
                                          ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      HapticFeedback.selectionClick();
                                                      focusNode.unfocus();
                                                      showPicker.value = !showPicker.value;
                                                    },
                                                    child: TextWidget(formatDate(selectedDate.value),
                                                        22.5, context.width),
                                                ),

                                                if (isDuration.value) ...[
                                                  Spacer(),
                                                  Icon(Icons.arrow_right),
                                                  Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      HapticFeedback.selectionClick();
                                                      focusNode.unfocus();
                                                      isSelectingEndDate.value = true;
                                                      showPicker.value = !showPicker.value;
                                                    },
                                                    child: TextWidget(
                                                        formatDate(endDate.value),
                                                        22.5,
                                                        context.width
                                                    ),
                                                  ),
                                                ],

                                              ],
                                            ),

                                          if (showPicker.value && !focusNode.hasFocus)
                                            Container(
                                              height: 200,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode.date,
                                                initialDateTime: isSelectingEndDate.value
                                                    ? endDate.value
                                                    : selectedDate.value,
                                                onDateTimeChanged: (dateTime) {
                                                  if (isSelectingEndDate.value) {
                                                    endDate.value = dateTime;
                                                    // DayFocusNode.requestFocus();
                                                  } else {
                                                    selectedDate.value = dateTime;
                                                  }
                                                },
                                              ),
                                            ),


                                          SizedBox(height: 10),
                                          Divider(
                                            color: Theme.of(context).dividerColor,
                                            thickness: 1,
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
                                  onPressed: () {
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
