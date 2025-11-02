import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';

class EventTextField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;

  const EventTextField(
      {super.key, required this.focusNode, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      cursorColor: context.isDark ? Colors.teal.shade900 : Colors.grey,
      cursorWidth: 2.5,
      decoration: InputDecoration(
        errorMaxLines: 1,
        hintText: ' 저장할 메모 내용을 입력해주세요 ...',
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        isDense: true,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        // suffixIcon: suffixIcon,
      ),
    );
  }
}
