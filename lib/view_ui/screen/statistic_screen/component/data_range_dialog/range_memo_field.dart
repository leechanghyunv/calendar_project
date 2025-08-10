import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/data_range_dialog/tax_dropdown_button.dart';

class RangeMemoField extends HookConsumerWidget {

  final TextEditingController boxMemoController;
  final Function(double)? onTaxChanged;

  const RangeMemoField({super.key, required this.boxMemoController,this.onTaxChanged,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final textLength = useListenableSelector(
        boxMemoController,
            () => boxMemoController.text.length
    );

    // 실시간으로 색상 변경
    final textColor = textLength >= 2
        ? Colors.grey.shade500
        : Colors.grey.shade50;


    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade800,
          width: 0.85,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: boxMemoController,
            cursorColor: Colors.grey.shade700,
            decoration: InputDecoration(
              hintText: ' 업체명, 현장명 입력',
              hintStyle: TextStyle(
                  fontSize: (width > 400 ? 16 : 15),
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 0,
              top: 6,
              bottom: 6,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('세율을 정해주세요',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: textColor,
                  fontSize: (width > 400 ? 14 : 13),
                ),
                ),
                Spacer(),
                TaxDropdownButton(
                  onTaxChanged: (double val){
                    onTaxChanged?.call(val);
                  },
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
