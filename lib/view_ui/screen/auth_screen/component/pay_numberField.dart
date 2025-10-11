import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../core/utils/formatter.dart';
import 'auth_textField/auth_field_decoration.dart';

class PayNumberField extends StatelessWidget {
  final String name;
  final FocusNode? focusNode;
  final String? hintText;
  final ValueChanged<String?>? onSubmitted;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const PayNumberField({
    super.key,
    required this.name,
    this.focusNode,
    this.hintText,
    this.onSubmitted,
    this.onChanged,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return authContainer(
      child: FormBuilderTextField(
        name: name,
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.numberWithOptions(signed: true),
        cursorColor: Colors.grey.shade700,
        cursorWidth: 4.0,

        decoration: customInputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
        inputFormatters: [
          CommaInputFormatter6Digits(),
        ],
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
