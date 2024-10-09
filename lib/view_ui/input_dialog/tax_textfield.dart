import 'package:calendar_project_240727/core/export.dart';

import '../../core/utils/converter.dart';

class TaxinputTextfield extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;

  const TaxinputTextfield(
      {super.key,
      this.onChanged,
      required this.textInputAction,
      this.focusNode});

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;


    double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;
    double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;

    return SizedBox(
      height: appWidth > 500 ? 24.sp : 47.5.sp,
      child: TextFormField(
        focusNode: focusNode,
        textInputAction: textInputAction,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          TwoDigitInputFormatter(), // 최대 길이 설정 (예: "12.34")
        ],
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          hintText: '10.4',
          hintStyle: TextStyle(
            fontSize: appWidth > 500 ? screenUtilSize(7.5) : screenUtilSize(15),
            color: Colors.grey[600],
          ),
          suffixText: '%',
          suffixStyle: TextStyle(
            fontSize: appWidth > 500 ? screenUtilSize(7.5) : screenUtilSize(15),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
