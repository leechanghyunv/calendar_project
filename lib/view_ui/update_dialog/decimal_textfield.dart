import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/converter.dart';

class DecimalTextfield extends StatelessWidget {

  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final Color? iconColor;

  const DecimalTextfield({super.key, this.onChanged, this.iconOnPressed, this.iconColor});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      cursorColor: Colors.purple.shade900,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
        TwoDigitInputFormatter(),
      ],
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade900),
          ),
          hintText: '입력 후 확인 아이콘을 눌러주세요',
          hintStyle: TextStyle(
            fontSize: 13,letterSpacing: 0.5,
          ),
          suffixStyle: TextStyle(
            fontSize: 13.5,
          ),
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,letterSpacing: 0.5,height: 1.5,
              fontSize: 15),
          suffixIcon: IconButton(
            iconSize: 30,
            splashRadius: 25,
            splashColor: Colors.grey.shade500,
            onPressed: iconOnPressed,
            icon: Icon(Icons.fingerprint_sharp,
              color: iconColor,
            ),
          )
      ),
      onChanged: onChanged,
    );
  }
}

