
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import '../../../../core/extentions/theme_color.dart';
import '/../../core/export_package.dart';
import '../../../../base_consumer.dart';

class CompanyListProviderText extends HookConsumerWidget {
  const CompanyListProviderText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    /// final eventState = ref.watch(eventViewModelProvider);
    /// 주요이벤트에 대한 내용을 제공한다

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

                TextWidget(
                    '${ref.selected.year}년 ${ref.selected.month.toString().padLeft(2, '0')}월 급여',
                    11, context.width,color: context.subTextColor),
              ],
            ),
          ),
          // SizedBox(width: 2.5),
          // Container(
          //   decoration: BoxDecoration(
          //     color: context.bTypeChipColor,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.5),
          //   child: Row(
          //     children: [
          //       TextWidget(
          //           ' 일비 ',
          //           11, context.width,color: context.subTextColor),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}