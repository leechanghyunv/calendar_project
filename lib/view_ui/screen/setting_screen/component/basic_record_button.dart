
import '../../../../core/export_package.dart';
import '../../../../core/utils/formatter.dart';

class SettingTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onSubmitted;

  const SettingTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.focusNode,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 70,
            height: 30,
            child: TextField(
              cursorColor: Colors.teal,
              cursorHeight: 15,
              controller: controller,
              focusNode: focusNode,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                DisplayNumberInputFormatter(),
              ],
              decoration: InputDecoration(
                // isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.teal, width: 2),
                ),
              ),
              onSubmitted: onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}