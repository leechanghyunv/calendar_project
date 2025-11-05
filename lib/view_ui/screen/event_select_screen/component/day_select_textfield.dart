import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';

class DaySelectTextField extends HookConsumerWidget {

  final FocusNode DayFocusNode;
  final TextEditingController DayController;

  const DaySelectTextField({super.key, required this.DayFocusNode, required this.DayController});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    useEffect(() {
      void listener() {

        // '일' 제거 - 순수 숫자만 추출
        String text = DayController.text.replaceAll('일', '');

        if (text.isNotEmpty) {
          // 숫자가 아닌 문자 모두 제거
          text = text.replaceAll(RegExp(r'[^0-9]'), '');

          // 최대 2자리까지만 허용 (예: 123 입력 시 12만 남김)
          if (text.length > 2) {
            text = text.substring(0, 2);
          }

          // 날짜 유효성 검사 (1-31일)
          int? day = int.tryParse(text);
          if (day != null && day > 31) {
            text = '31';  // 31일 초과 시 31로 제한
          } else if (day != null && day < 1 && text.length == 2) {
            text = '1';   // 00 입력 시 1로 변경
          }

          // 마지막에 '일' 자동 추가
          final newText = text.isEmpty ? '' : text + '일';

          // 변경사항이 있을 때만 업데이트 (무한루프 방지)
          if (DayController.text != newText) {
            DayController.value = TextEditingValue(
              text: newText,
              selection: TextSelection.collapsed(offset: newText.length - 1), // 커서를 '일' 앞에 위치
            );
          }
        }
      }


      DayController.addListener(listener);
      return () => DayController.removeListener(listener);
    }, [DayController]);


    return TextField(
      focusNode: DayFocusNode,
      controller: DayController,
      textAlign: TextAlign.center,  // 텍스트 중앙 정렬

      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      cursorColor: context.isDark ? Colors.teal.shade900 : Colors.grey,
      cursorHeight: 12.5,
      decoration: InputDecoration(
        isDense: true,
        // errorBorder: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: context.isDark ? Colors.teal.shade900 : Colors.grey,
              width: 2),
        ),
        // focusedErrorBorder: InputBorder.none,
        // border: InputBorder.none,
        // enabledBorder: InputBorder.none,

      ),
    );
  }
}
