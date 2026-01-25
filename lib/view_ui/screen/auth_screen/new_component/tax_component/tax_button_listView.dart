import 'package:calendar_project_240727/view_ui/screen/auth_screen/new_component/tax_component/tax_button.dart';

import '../../../../../base_app_size.dart';
import '../../../../../core/export_package.dart';
import '../../../../../core/extentions/size_extension.dart';

class TaxButtonList extends HookWidget {
  final double? selectedTaxRate;
  final Function(double) onTaxSelected;

  const TaxButtonList({
    super.key,
    this.selectedTaxRate,
    required this.onTaxSelected,
  });

  @override
  Widget build(BuildContext context) {
    final taxRates = [
      {'rate': 3.3, 'isSpecial': true},
      {'rate': 10.0},
      {'rate': 10.4},
      {'rate': 11.0},
      {'rate': 12.0},

    ];

    final sizes = DefaultSizes(context.width);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: sizes.payChipSize,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: taxRates.length,
          separatorBuilder: (context, index) => SizedBox(width: 8),
          itemBuilder: (context, index) {
            final taxData = taxRates[index];
            final rate = taxData['rate'] as double;
            final isSpecial = taxData['isSpecial'] as bool? ?? false;

            return TaxButton(
              label: '${rate}%',
              isSpecial: isSpecial,
              isSelected: selectedTaxRate == rate,
              onPressed: () => onTaxSelected(rate),
            );
          },
        ),
      ),
    );
  }
}