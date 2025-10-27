import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/event_select_screen/provider/event_type_provider.dart';
import '../../../../core/export_package.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/left_eleveted_button.dart';
import '../auth_screen/component/auth_textField/auth_field_decoration.dart';
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
                EventPickerCalendar(

                ),
                SizedBox(height: 25),
                Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    EventTextField(
                                      focusNode: focusNode,
                                      controller: controller,

                                    ),
                                    Spacer(),

                                  ],
                                ),
                              ),
                          ),

                          SizedBox(height: 10),

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
                                  text: '27일 등록하기',
                                  onPressed: () => Navigator.pop(context),
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
