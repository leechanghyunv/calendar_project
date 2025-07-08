

import 'package:calendar_project_240727/base_consumer.dart';

import '../../../../../core/export_package.dart';

class TaxDropdownButton extends HookConsumerWidget {

  final Function(double)? onTaxChanged; // 콜백 추가

  const TaxDropdownButton({super.key,this.onTaxChanged});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final contract = ref.contract;

    final taxRates = contract.maybeWhen(
      data: (contracts) {
        if (contracts.isEmpty) return ['3.3'];

        // 중복 제거하고 정렬
        final rates = contracts
            .map((c) => c.tax)
            .toSet()
            .toList()
          ..sort()
          ..take(3);

        return rates;
      },
      orElse: () => ['3.3'],
    );

    // 현재 선택된 세율 (가장 최근 계약의 세율)
    final currentTax = contract.maybeWhen(
      data: (contracts) => contracts.isNotEmpty
          ? '${contracts.last.tax}%'
          : '3.3%',
      orElse: () => '3.3%',
    );

    final dropdownValue = useState<String>(currentTax);

    TextStyle getStyle = TextStyle(
        fontSize: 13,
        color: Colors.grey.shade700,
        fontWeight: FontWeight.bold
    );

    return Container(
      height: 26,
      constraints: BoxConstraints(
        minWidth: 65,
        maxWidth: 80, // 최대 너비 제한
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.grey.shade50,
        border: Border.all(width: 1.25, color: Colors.grey.shade50),
        borderRadius: BorderRadius.all(
            Radius.circular(10),
        ),
      ),
      child: DropdownButton<String>(
        value: dropdownValue.value,
        onChanged: (String? newValue) {
          if (newValue != null) {
            dropdownValue.value = newValue;
            final taxValue = double.parse(newValue.replaceAll('%', ''));
            onTaxChanged?.call(taxValue);
          }
        },
        underline: SizedBox(),
        isDense: true, // 컴팩트하게
        icon: Icon(Icons.arrow_drop_down,
          size: 16,color: Colors.grey,
        ),
        items: taxRates.map((rate) {
          final displayRate = '${rate}%';
          return DropdownMenuItem(
            value: displayRate,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(displayRate,
                  textScaler: TextScaler.noScaling,
                  style: getStyle),
            ),
          );
        }).toList(),
      ),
    );
  }
}
