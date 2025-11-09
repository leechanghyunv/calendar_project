import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/formatter.dart';
import '../../auth_screen/component/auth_textField/auth_field_decoration.dart';

class AdditionalTextField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final VoidCallback? onTap;

  const AdditionalTextField(
      {super.key,
        required this.focusNode,
        required this.controller,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.numberWithOptions(signed: true),
      cursorColor: Colors.grey.shade500,
      decoration: customInputDecoration(
        hintText: ' 10,000',

        suffixIcon: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextWidget(
                  '# 나가기',
                  15,
                  context.width,
                  color: Colors.teal.shade700,
              ),
            ),

        ),

      ),
      inputFormatters: [
        CommaInputFormatter6Digits(),
      ],
    );
  }
}
