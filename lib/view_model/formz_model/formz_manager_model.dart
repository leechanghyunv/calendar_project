import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../model/decimal_pay_model.dart';


class GoalInput extends FormzInput<int, String> {
  const GoalInput.pure() : super.pure(0);
  const GoalInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int value) {
    if (value < 0 || value == 0) {
      return '목표금액은 필수 입력사항입니다.';
    }

    if (value <= 100) {
      return '100 만원 이상 입력해주세요';
    }

    if (value <= 10000) {
      return '100 만원 이상 입력해주세요';
    }

    // 금액에 따른 표시 방식 결정
    if (value >= 100000000) {  // 1억원 이상일 때만 억 단위로 표시
      double billion = value / 100000000;
      return '목표금액은 ${billion.toStringAsFixed(1)} 억원 입니다';
    }

    // 1억원 미만은 모두 만원 단위로 표시
    double tenThousand = value / 10000;
    return '목표금액은 ${tenThousand.toStringAsFixed(0)} 만원 입니다';
  }

}

class PayFirstInput extends FormzInput<int, String> {
  const PayFirstInput.pure() : super.pure(0);
  const PayFirstInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int value) {
    if (value < 0 || value == 0) {
      return '일당은 필수 입력사항입니다.';
    } else if (value < 100000) {
      return '₩ 100,000원 이상 입력해주세요';
    } else if (value >= 100000) {
      return '연장 1.5배, 야간 2배 자동입력 버튼 활성화';
    }
    return null;
  }
}
class PayInput extends FormzInput<int, String> {
  const PayInput.pure() : super.pure(0);
  const PayInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int value) {
    if (value < 0 || value == 0) {
      return '일당은 필수 입력사항입니다.';
    } else if (value < 100000) {
      return '₩ 100,000원 이상 입력해주세요';
    } else if (value >= 100000) {
      return '${NumberFormat.simpleCurrency(locale: 'ko', name: '₩ ', decimalDigits: 0).format(value)}원 입니다';
    }
    return null;
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

    if(value <= 0){
      return '없으면 넘어 가세요';
    } else {
      if(valueLength > 5){
        return '일비가 너무 많습니다.';
      } else {
        return '일비 ${NumberFormat.simpleCurrency(locale: 'ko', name: '₩', decimalDigits: 0).format(value)}원';
      }
    }




  }


}
