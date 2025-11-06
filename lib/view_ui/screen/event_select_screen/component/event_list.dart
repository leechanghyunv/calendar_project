
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
          ? Center(
        child: TextWidget(
          '등록된 일정이 없습니다',
          14,
          context.width,
          color: context.subTextColor,
        ),
      )
          : Expanded(
        child: ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            final event = value[index];
            return ListTile(
              title: TextWidget(event.name, 16, context.width),
              subtitle: TextWidget(
                event.date.toString(),
                12,
                context.width,
                color: context.subTextColor,
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
