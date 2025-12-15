import 'package:calendar_project_240727/core/export_package.dart';

class WorksiteTextField extends StatelessWidget {

  final FocusNode? focusNode;
  final TextEditingController? textController;
  final ValueChanged<String?>? onSubmitted;
  final Function(String?)? onChanged;

  const WorksiteTextField(
      {super.key,
      this.focusNode,
      this.textController,
      this.onSubmitted,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.grey.shade700,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
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
      ),
    );
  }
}
