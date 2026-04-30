
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import '../../../../core/extentions/theme_color.dart';
import '/../../core/export_package.dart';
import '../../../../base_consumer.dart';

class CompanyListProviderText extends HookConsumerWidget {
  const CompanyListProviderText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SizedBox(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.bTypeChipColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.5),
            child: Row(
              children: [
                /// ~ 26일까지
                TextWidget(
                    '${ref.selected.year}년 ${ref.monthString}월 급여',
                    11,color: context.subTextColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}