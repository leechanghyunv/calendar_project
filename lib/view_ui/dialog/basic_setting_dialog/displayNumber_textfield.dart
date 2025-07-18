
import '../../../core/export_package.dart';
import '../../../core/utils/formatter.dart';

class DisplayNumberTextField extends StatefulWidget {

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;

  const DisplayNumberTextField({super.key, required this.controller, required this.focusNode, required this.hintText});

  @override
  State<DisplayNumberTextField> createState() => _DisplayNumberTextFieldState();
}

class _DisplayNumberTextFieldState extends State<DisplayNumberTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.number,
      cursorColor: Colors.grey.shade700,
      cursorWidth: 2.0,
      inputFormatters: [
        DisplayNumberInputFormatter(),
      ],
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 3),
          isDense: true,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
      ),
    );
  }
}
