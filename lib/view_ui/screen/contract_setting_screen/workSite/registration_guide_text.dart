import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../../core/export_package.dart';
import '../../../../core/utils/converter.dart';

class RegistrationGuideText extends HookConsumerWidget {
  final List<TextEditingController> controllers;
  final ValueNotifier<int> guideIndex; // 👈 추가


  const RegistrationGuideText({super.key, required this.controllers, required this.guideIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String? parseAndFormat(String text) {
      final raw = int.tryParse(text.replaceAll(',', ''));
      if (raw == null) return null;
      return formatAmount(raw);
    }

    final currentIndex = useValueListenable(guideIndex);

    final t0 = useListenable(controllers[0]).text;
    final t1 = useListenable(controllers[1]).text;
    final t2 = useListenable(controllers[2]).text;
    final t3 = useListenable(controllers[3]).text;
    final texts = [t0, t1, t2, t3];

    final widgetTexts = [
      t0.length >= 2 ? '${texts[0]}' : '${texts[0]}',
      t1.length >= 5 ? parseAndFormat(t1) ?? t1 : t1,
      t2.length >= 2 ? '${texts[2]}%' : texts[2],
      t3.length >= 4 ? parseAndFormat(t3) ?? t3 : '',
    ];

    return Row(
      children: [
        for (int i = 0; i <= currentIndex; i++)
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: texts[i].length >= 1 ? 1.0 : 0.0,
              child: texts[i].length >= 1
                  ? _StepWidget(text: widgetTexts[i])
                  : SizedBox.shrink(),
            ),
          ),
      ],
    );
  }
}

class _StepWidget extends StatelessWidget {
  final String text;
  const _StepWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,6.0,8.0,12.0),
      child: Row(
        children: [
          TextWidget(text,13),
        ],
      ),
    );
  }
}