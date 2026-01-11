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

    // if (value.decimal == 0.0) {
    //   return ' 휴무로 저장합니다';
    // } else if (value.decimal == 0.5) {
    //   return ' ${value.decimal} 공수 조퇴';
    // } else if (value.decimal == 1.0) {
    //   return ' ${value.decimal} 공수 정상근무로 저장합니다';
    // } else if (value.decimal == 1.5) {
    //   return ' ${value.decimal} 공수 연장근무로 저장합니다';
    // } else if (value.decimal == 2.0) {
    //   return ' ${value.decimal} 공수 야간근무로 저장합니다';
    // } else if (value.decimal >= 3.0) {
    //   return ' ${value.decimal}공수 ${formatAmount(val)}로 저장합니다';
    // } else {
    //   return ' ${value.decimal} 공수 ${formatAmount(val)}로 저장합니다';
    // }
  }

}