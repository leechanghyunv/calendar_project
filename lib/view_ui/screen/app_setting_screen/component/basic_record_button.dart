
import '../../../../core/export_package.dart';
import '../../../../core/utils/formatter.dart';

class SettingTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onSubmitted;

  const SettingTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: 100,
        height: 40,
        child: TextField(
          cursorColor: Colors.teal,
          cursorHeight: 15,
          controller: controller,
          focusNode: focusNode,

          keyboardType: TextInputType.numberWithOptions(signed: true),
          textInputAction: TextInputAction.next,
          inputFormatters: [
            DisplayNumberInputFormatter(),
          ],
          decoration: InputDecoration(
            // isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(
                  color: Colors.teal,
                  width: 2.5),
            ),
          ),
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}