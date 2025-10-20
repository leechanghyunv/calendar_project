import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import '../../../../../core/export_package.dart';
import '../../../model/work_history_model.dart';
import '../../main_screen_component/main_box_component/setting_component/number_picker_modal.dart';


class DayInfoDialog extends ConsumerWidget {

  final List<WorkHistory> events;

  const DayInfoDialog(this.events, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final WorkHistory event = events[0];

    final String calendarText =  event.record == 0.0 ? '휴일' : '${event.record.toString()}공수';
    final String calendarPayText = '${(event.pay/10000).toStringAsFixed(1)}만원';
    final String calendarMemoText = event.memo.length > 1 ?  event.memo.toString() : '없습니다';

    return AlertDialog(
      backgroundColor: context.dialogColor,
      shape: context.dialogShape,
      title: TextWidget(
          ' ${ref.monthString}월 ${ref.dayString}일 공수기록',
          16,context.width,
        color: context.textColor,
      ),
      content: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.5),
            color: context.isDark ? Colors.black54 : Colors.grey.shade200,
          border: context.isDark ? Border.all(
            color:  Colors.white,
            width: 1.25,
          ) : null,
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,horizontal: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              TextWidget('일당: ${calendarPayText}',
                  14.5, context.width,
                  color: context.textColor),
              SizedBox(height: 7.5),
              TextWidget('공수: ${calendarText}', 14.5,
                  context.width,
                  color: context.textColor),
              SizedBox(height: 7.5),
              TextWidget('메모: ${calendarMemoText}', 14.5,
                  context.width,
                  color: context.textColor),



            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: TextWidget('나가기', 15, context.width,
              color: context.textColor),
        ),
        TextButton(
          onPressed: (){
            Navigator.pop(context);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              NumberPickerModal(context);
            });
          },
          child: TextWidget('수정', 15, context.width,
              color: context.textColor),
        ),
      ],

    );
  }
}
