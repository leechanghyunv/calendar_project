
import 'package:formz/formz.dart';

class DeletionInput extends FormzInput<String,String> {
  const DeletionInput.pure() : super.pure('');
  const DeletionInput.dirty([String value = '']) : super.dirty(value);

  final String _value = 'Delete file';

  @override
  String? validator(String value) {
    if(value == _value) {
      return '아이콘이 활성화되었습니다';
    }
    return "'Delete file' 를 입력해주세요";
  }
}