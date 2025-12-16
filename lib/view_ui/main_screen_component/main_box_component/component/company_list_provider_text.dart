
import '../../../../core/extentions/theme_color.dart';
import '../../../../view_model/view_provider/selected_companise_model.dart';
import '/../../core/export_package.dart';
import '../../../../base_consumer.dart';

class CompanyListProviderText extends ConsumerWidget {
  const CompanyListProviderText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.bTypeChipColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Text(
              ' ${ref.selected.year}년 ${ref.selected.month.toString().padLeft(2, '0')}월 급여 ',
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: context.subTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}