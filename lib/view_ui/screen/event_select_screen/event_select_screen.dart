import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/event_select_screen/provider/event_type_provider.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
import '../../../../core/export_package.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/left_eleveted_button.dart';
import '../auth_screen/component/auth_textField/auth_field_decoration.dart';
import 'component/event_memo_dialog.dart';
import 'component/event_picker_calendar.dart';
import 'component/event_textfield.dart';
import 'component/guide_text.dart';

class EventSelectScreen extends HookConsumerWidget {
  const EventSelectScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final focusNode = useFocusNode();
    final controller = useTextEditingController();


    final eventType = ref.watch(eventTypeProvider.notifier);
    final eventTypeState = ref.watch(eventTypeProvider);

    void callEventMemoDialog(){
      showDialog(
        context: context,
        builder: (context) => EventMemoDialog(),
      );
    }

    final isKorean = useState(true);

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
                // EventPickerCalendar(
                //   onDaySelected: (_) {
                //     focusNode.requestFocus();
                //     callEventMemoDialog();
                //   },
                //   onRangeSelected: (start, end) {
                //     focusNode.requestFocus();
                //     Future.delayed(Duration(microseconds: 10000));
                //     callEventMemoDialog();
                //
                //   },
                //
                // ),
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

                                    EventTextField(
                                      focusNode: focusNode,
                                      controller: controller,

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
                                          // SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              Icon(Icons.access_time,color: context.subTextColor),
                                              SizedBox(width: 15),
                                              TextWidget('날짜 선택', 15, context.width,
                                              color: context.subTextColor),
                                              Spacer(),
                                              Switch(
                                                value: isKorean.value,
                                                onChanged: (bool val){},
                                                activeColor: Colors.teal,
                                              ),

                                            ],
                                          ),
                                          // SizedBox(height: 10),


                                          GestureDetector(
                                            onTap: (){
                                              TimePickerSpinnerPopUp(
                                                // mode: CupertinoDatePickerMode.time,
                                                initTime: DateTime.now(),
                                                onChange: (dateTime) {
                                                  // Implement your logic with select dateTime
                                                },
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                TextWidget('25.10.10(월)', 25, context.width),
                                              ],
                                            ),
                                          ),


                                          SizedBox(height: 10),
                                          Divider(
                                            color: Theme.of(context).dividerColor,
                                            thickness: 1,
                                          ),


                                          // Row(
                                          //   crossAxisAlignment: CrossAxisAlignment.center,
                                          //   children: [
                                          //     Icon(Icons.check,color: context.subTextColor),
                                          //     SizedBox(width: 15),
                                          //     TextWidget('기념일 지정', 15, context.width,
                                          //         color: context.subTextColor),
                                          //     Spacer(),
                                          //     Switch(
                                          //       value: isKorean.value,
                                          //       onChanged: (bool val){},
                                          //       activeColor: Colors.teal,
                                          //     ),
                                          //
                                          //   ],
                                          // ),
                                          // Divider(
                                          //   color: Theme.of(context).dividerColor,
                                          //   thickness: 1,
                                          // ),
                                          SizedBox(height: 10),
                                          TextWidget('5개월간 매월 15일 메모된 날짜가 달력에 등록됩니다', 13.5, context.width,
                                              color: context.subTextColor),
                                          // TextWidget('5개월간 매월 15일 메모된 날짜가 달력에 등록됩니다', 13.5, context.width,
                                          //     color: context.subTextColor),

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
                                flex: 1,
                                child: LeftElevatedButton(
                                  text: eventType.label,
                                  onPressed: () => eventType.toggle(),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: CustomElevatedButton(
                                  text: '등록하기',
                                  onPressed: () {

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
