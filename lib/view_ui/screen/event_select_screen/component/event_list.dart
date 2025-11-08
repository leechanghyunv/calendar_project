
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../view_model/sqlite_model/event_model.dart';

class EventListWidget extends HookConsumerWidget {
  const EventListWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final eventState = ref.watch(eventViewModelProvider);

    return switch (eventState) {
      AsyncData(:final value) => value.isEmpty
          ? SizedBox.shrink()
          : Expanded(
        child: ListView.separated(
          itemCount: value.length,
          separatorBuilder: (context, index) => SizedBox(height: 8),
          itemBuilder: (context, index) {
            final event = value[index];
            return Container(
              margin: EdgeInsets.only(top: index == 0 ? 24 : 0),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.boxColor,
                borderRadius: BorderRadius.circular(12),
                border: context.isLight ? null : Border.all(
                  width: 0.75,
                  color: Colors.white,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        TextWidget(
                          event.date.day.toString(),
                          22,
                          context.width,
                          color: Colors.teal,
                        ),
                        TextWidget(
                          '${event.date.month}월',
                          12,
                          context.width,
                          color: Colors.teal[200],
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextWidget(
                      event.name,
                      14,
                      context.width,
                      color: context.isDark ? Colors.grey[100] : Colors.grey[800],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      ref.read(eventViewModelProvider.notifier).deleteEvent(event.date);
                    },
                    child: Icon(Icons.remove,
                      color: context.subTextColor,
                    ),
                  )
                ],
              ),


            );
          },
        ),
      ),
      AsyncError(:final error) => TextWidget(
        'Error: $error',
        14,
        context.width,
        color: context.subTextColor,
      ),
      _ => Center(
          child: TextWidget(
            'loading......',
            14,
            context.width,
            color: context.subTextColor,
          ),
      ),
    };

  }
}
