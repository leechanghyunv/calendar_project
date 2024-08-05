import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

class GoalInput extends FormzInput<int, String> {
  const GoalInput.pure() : super.pure(0);
  const GoalInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int val){

    if(val < 0 || val == 0){
      return '목표금액은 필수 입력사항입니다.';
    } else if(val < 100000) {
      return '금액을 1,000,000원 이상 입력해주세요';
    } else if(val > 100000 || val == 100000){
      return '${NumberFormat.simpleCurrency(
          locale: 'ko',name: '₩ ',decimalDigits: 0).format(val)}원 입니다';
    }
    else if(val > 1000000 || val == 1000000){
      return '${NumberFormat.simpleCurrency(
          locale: 'ko',name: '₩ ',decimalDigits: 0).format(val)}원 입니다';
    }
  }
}

class PayInput extends FormzInput<int, String> {
  const PayInput.pure() : super.pure(0);
  const PayInput.dirty({int val = 0}) : super.dirty(val);

  @override
  String? validator(int val){
    if(val < 0 || val == 0){
      return '일당은 필수 입력사항입니다.';
    } else if(val < 100000) {
      return '일당은 100,000원 이상 입력해주세요';
    } else if(val > 100000) {
      return '${NumberFormat.simpleCurrency(
          locale: 'ko',name: '₩ ',decimalDigits: 0).format(val)}원 입니다';
    } else if(val > 100000 || val == 100000){
      return '${NumberFormat.simpleCurrency(
          locale: 'ko',name: '₩ ',decimalDigits: 0).format(val)}원 입니다';
    }
  }
}


class TaxInput extends FormzInput<String, String> {
  const TaxInput.pure() : super.pure('');
  const TaxInput.dirty({String val = ''}) : super.dirty(val);

  @override
  String? validator(String? val){
    if(val == null){
      return '입력되지 않았습니다.';
    }
    final parts = val.split('.');
    final intPart = parts[0];
    final decPart = parts.length > 1 ? parts[1] : '';
    if (intPart.length > 2 || (decPart.isNotEmpty && decPart.length > 2)){
      return '정수 또는 소수 부분이 2자리 이상입니다.';
    }
    final doubleValue = double.tryParse(val);
    if (doubleValue == null){
      return '유효한 값이 아닙니다.';
    }
    return '세율은 $val%';
  }
}