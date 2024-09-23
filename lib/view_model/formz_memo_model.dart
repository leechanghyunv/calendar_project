
import 'package:formz/formz.dart';

class MemoInput extends FormzInput<String,String>{
  const MemoInput.pure() : super.pure('');
  const MemoInput.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String value) {
    if(value.isNotEmpty){
      return value.length < 2
          ? '1. 메모는 2자 이상 입력, 2. 입력후 완료 누르기'
          : '메모 내용은 원하는 날짜를 누르고계시면 보실 수 있습니다.';
    } else {
      return '메모를 입력해주세요 입력후 완료를 눌러주세요';
    }

  }
}