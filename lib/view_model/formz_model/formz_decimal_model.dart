import 'package:formz/formz.dart';

import '../../core/utils/converter.dart';
import '../../model/decimal_pay_model.dart';

class DecimalInput extends FormzInput<DecimalPayModel, String> {
  const DecimalInput.pure()
      : super.pure(
      const DecimalPayModel(month: '', day: '', pay: 0, decimal: 0.0,));

  const DecimalInput.dirty(super.decimalPayModel) : super.dirty();

  @override
  String? validator(DecimalPayModel value) {
    final calculated = value.pay * value.decimal;
    final val = calculated.toInt();

    return switch (value.decimal) {
      0.0 => '휴무로 저장합니다',
      0.5 => '${value.decimal} 공수 조퇴',
      1.0 => '${value.decimal} 공수 정상근무로 저장합니다',
      1.5 => '${value.decimal} 공수 연장근무로 저장합니다',
      2.0 => '${value.decimal} 공수 야간근무로 저장합니다',
      _ => '${value.decimal}공수 ${formatAmount(val)}로 저장합니다',
    };

  }

}