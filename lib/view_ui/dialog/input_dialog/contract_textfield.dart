import 'package:calendar_project_240727/core/export_package.dart';

import '../dialog_text.dart';

class MoneyinputTextfield extends StatelessWidget {
  final bool? autofocus;
  final FocusNode? focusNode;
  final String? hintMsg;
  final String? labelMsg;
  final String? initialValue;

  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final TextEditingController? controller;

  const MoneyinputTextfield(
      {super.key,
        this.autofocus,
        this.hintMsg,
        this.labelMsg,
        this.initialValue,

        this.onChanged,
        required this.textInputAction,
        this.focusNode,
        this.controller,
        this.suffixIcon,
        this.suffixIconColor});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height:  47.sp,
        child: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.done,
          autofocus: autofocus ?? false,
          focusNode: focusNode,
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          initialValue: initialValue,
          inputFormatters: [
            ThousandsFormatter(),
          ],
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            prefixText: '₩ ',
            prefixStyle: ContractFontStyle(),
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor,
            hintText: hintMsg,
            hintStyle: ContractFontStyle().copyWith(color: Colors.grey[600]),
            labelText: labelMsg, /// '🌟 1공수(정상근무) *', 🚀 1.5공수(연장근무) * 🎉 2공수(야간근무) *
            labelStyle: ContractFontStyle().copyWith(color: Colors.grey[900]),
          ),
        ),

      ),
    );
  }
}
