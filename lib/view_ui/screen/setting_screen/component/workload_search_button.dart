import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/left_eleveted_button.dart';

class WorkloadSearchButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const WorkloadSearchButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: LeftElevatedButton(
                text: '주요일정 등록',
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.isDark ? Colors.teal.shade900 : Colors.teal,
                    padding: EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    elevation: 1,
                  ),
                  onPressed: onPressed,
                child: TextWidget(
                  text, 15,
                  context.width,
                  color: context.buttonColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

      ],
    );
  }
}
