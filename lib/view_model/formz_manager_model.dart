import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../model/decimal_pay_model.dart';

class GoalInput extends FormzInput<int, String> {
  const GoalInput.pure() : super.pure(0);
  const GoalInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int value) {
    // 100,000,000 초과인 경우를 먼저 검사
    if (value > 100000000) {
      double billion = value / 100000000;
      return '목표금액은 ${billion.toStringAsFixed(1)} 억원 입니다';
    } else if (value > 10000000) { // 10,000,000 초과인 경우
      double tenMillion = value / 10000;
      return '목표금액은 ${tenMillion.toStringAsFixed(0)} 만원 입니다';
    } else if (value < 0 || value == 0) {
      return '목표금액은 필수 입력사항입니다.';
    } else if (value < 1000000) {
      return '₩ 1,000,000원 이상 입력해주세요';
    } else if (value >= 1000000) {
      return '${NumberFormat.simpleCurrency(locale: 'ko', name: '₩ ', decimalDigits: 0).format(value)}원 입니다';
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

class TaxInput extends FormzInput<String, String> {
  const TaxInput.pure() : super.pure('');
  const TaxInput.dirty({String val = ''}) : super.dirty(val);

  @override
  String? validator(String? value) {
    if (value == null) {
      return '입력되지 않았습니다.';
    }
    final parts = value.split('.');
    final intPart = parts[0];
    final decPart = parts.length > 1 ? parts[1] : '';
    if (intPart.length > 2 || (decPart.isNotEmpty && decPart.length > 2)) {
      return '정수 또는 소수 부분이 2자리 이상입니다.';
    }
    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      return '유효한 값이 아닙니다.';
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
      return '일비가 없으시다면 바로 좌측 아이콘을 눌러주세요';
    } else {
      if(valueLength > 5){
        return '일비가 너무 많습니다. ${NumberFormat.simpleCurrency(locale: 'ko', name: '₩', decimalDigits: 0).format(value)}원이 맞나요?';
      } else {
        return '입력된 일비는 ${NumberFormat.simpleCurrency(locale: 'ko', name: '₩', decimalDigits: 0).format(value)}원 입니다';
      }
    }




  }


}
