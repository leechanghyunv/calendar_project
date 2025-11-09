import 'package:calendar_project_240727/view_ui/screen/auth_screen/component/auth_textField/auth_field_decoration.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/formatter.dart';

class NumberField extends StatelessWidget {
  final String? hintText;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final ValueChanged<String?>? onSubmitted;
  final Function(String?)? onChanged;
  final Widget? suffixIcon;

  const NumberField(
      {super.key,
      this.focusNode,
      required this.controller,
      this.hintText,
      this.onSubmitted,
      this.onChanged,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return authContainer(
      child: TextField(
        controller: controller,
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
          CommaInputFormatter5Digits(),
        ],
      ),
    );
  }
}
