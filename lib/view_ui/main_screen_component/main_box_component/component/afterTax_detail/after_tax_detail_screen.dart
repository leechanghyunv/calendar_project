import '../../../../../core/export_package.dart';
import '../../../../../core/extentions/modal_extension.dart';
import '../../../../../core/extentions/theme_color.dart';
import '../../../../widgets/info_row.dart';


void afterTaxModal(BuildContext context) {
  context.showModal(
    heightRatio: 0.45,
    child: AfterTaxDetailScreen(),
  );
}


class AfterTaxDetailScreen extends StatelessWidget {
  const AfterTaxDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8.0,horizontal: 16
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InfoRow(
                      title: '일당 입력하기',
                      subtitle: '근로수당,세율을 설정합니다',
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: InkWell(
                        onTap: (){
                          HapticFeedback.selectionClick();
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Icon(Icons.keyboard_arrow_down,
                            color: context.isDark ? Colors.white : Colors.grey.shade700,
                            size: 25),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
    );
  }
}
