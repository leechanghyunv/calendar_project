
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/new_component/tax_component/tax_button_listView.dart';

import '../../../../../core/export_package.dart';
import '../../../../../core/widget/text_widget.dart';

class TaxComponent extends StatelessWidget {
  final double taxRate;
  final double sliderValue;
  final ValueChanged<double> onTaxChanged;
  final ValueChanged<double> onSliderChanged;
  final ValueChanged<double> onTaxButtonSelected;

  const TaxComponent({
    Key? key,
    required this.taxRate,
    required this.sliderValue,
    required this.onTaxChanged,
    required this.onSliderChanged,
    required this.onTaxButtonSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appWidth = context.width;
    final appHeight = context.height;

    return Column(
      children: [
        appHeight > 750 ? SizedBox(height: 20) : SizedBox(height: 15),
        Container(
          height: 130,
          width: appWidth,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(width: 1, color: Colors.grey.shade700),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0),
                child: Row(
                  children: [
                    TextWidget('세율을 설정해주세요 (${taxRate.toStringAsFixed(1)}%)',
                        13.5, appWidth, color: Colors.grey.shade700),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(0xFF059669),
                          inactiveTrackColor: Colors.grey[300],
                          thumbColor: Colors.white,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
                          overlayColor: Colors.grey.withOpacity(0.2),
                        ),
                        child: Slider(
                          value: sliderValue,
                          min: 7,
                          max: 15,
                          divisions: 70,
                          onChanged: (val) {
                            onSliderChanged(val);
                            onTaxChanged(val);
                          },
                        ),
                      ),
                    ),
                    TextWidget('${taxRate.toStringAsFixed(1)}%', 13.5, appWidth,
                        color: Colors.grey.shade700),
                  ],
                ),
              ),
              TaxButtonList(
                selectedTaxRate: taxRate,
                onTaxSelected: onTaxButtonSelected,
              ),
              Spacer(),
            ],
          ),
        ),
        appHeight > 750 ? SizedBox(height: 20) : SizedBox(height: 7.5),
      ],
    );
  }
}