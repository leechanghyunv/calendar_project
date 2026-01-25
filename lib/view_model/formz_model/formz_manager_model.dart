import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../model/decimal_pay_model.dart';


class GoalInput extends FormzInput<int, String> {
  const GoalInput.pure() : super.pure(0);
  const GoalInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int value) {
    return switch (value) {
      <= 0 => '목표금액은 필수 입력사항입니다.',
      <= 100 => '100 만원 이상 입력해주세요',
      <= 10000 => '100 만원 이상 입력해주세요',
      >= 100000000 => '목표금액은 ${(value / 100000000).toStringAsFixed(1)} 억원 입니다',
      _ => '목표금액은 ${(value / 10000).toStringAsFixed(0)} 만원 입니다',
    };
  }

}

class PayFirstInput extends FormzInput<int, String> {
  const PayFirstInput.pure() : super.pure(0);
  const PayFirstInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int value) {
    return switch (value) {
      <= 0 => '일당은 필수 입력사항입니다.',
      < 100000 => '₩ 100,000원 이상 입력해주세요',
      >= 100000 => '연장 1.5배, 야간 2배 자동입력 버튼 활성화',
      _ => null,
    };
  }
}
class PayInput extends FormzInput<int, String> {
  const PayInput.pure() : super.pure(0);
  const PayInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int value) {
    return switch (value) {
      <= 0 => '일당은 필수 입력사항입니다.',
      < 100000 => '₩ 100,000원 이상 입력해주세요',
      _ => '${NumberFormat.simpleCurrency(locale: 'ko', name: '₩ ', decimalDigits: 0).format(value)}원 입니다',
    };
  }
}

class DecimalInput extends FormzInput<DecimalPayModel, String> {
   const DecimalInput.pure()
      : super.pure(const DecimalPayModel(
       month: '', day: '', pay: 0, decimal: 0.0));
  const DecimalInput.dirty({DecimalPayModel}) : super.dirty(DecimalPayModel);

  @override
  String? validator(DecimalPayModel value) {
    return null;
  
    

  }
}

class TaxInput extends FormzInput<double, String> {
  const TaxInput.pure() : super.pure(0.0);
  const TaxInput.dirty({double val = 0.0}) : super.dirty(val);

  @override
  String? validator(double? value) {
    if (value == null) {
      return '입력되지 않았습니다.';
    }
    final String stringValue =value.toString();
    final parts = stringValue.split('.');
    final intPart = parts[0];
    final decPart = parts.length > 1 ? parts[1] : '';
    if (intPart.length > 2 || (decPart.isNotEmpty && decPart.length > 2)) {
      return '정수 또는 소수 부분이 2자리 이상입니다.';
    }

    return '세율은 $value%';
  }
}

class SubsidyInput extends FormzInput<int,String>{
  const SubsidyInput.pure() : super.pure(0);
  const SubsidyInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int value) {

    final valueLength = value.toString().length;

    print('value: $value valueLength : ${valueLength}');

    return switch ((value, valueLength)) {
      (<= 0, _) => '없으면 넘어 가세요',
      (_, > 5) => '일비가 너무 많습니다.',
      _ => '일비 ${NumberFormat.simpleCurrency(locale: 'ko', name: '₩', decimalDigits: 0).format(value)}원',
    };
  }


}
