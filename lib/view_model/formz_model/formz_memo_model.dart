
import 'package:formz/formz.dart';

class MemoInput extends FormzInput<String,String>{
  const MemoInput.pure() : super.pure('');
  const MemoInput.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if(value.isNotEmpty){
      return value.length < 2
          ? ' 메모는 2자 이상 입력, 입력후 확인버튼'
          : '상세한 내용은 해당 날짜를 누르고계시면 열람';
    } else {
      return '입력후 확인을 눌러주세요';
    }

  }
}