
import 'package:flutter/material.dart';

class DeletionTextfield extends StatelessWidget {

  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final Color? iconColor;

  const DeletionTextfield({super.key, this.onChanged, this.iconOnPressed, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.red.shade700,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700),
          ),
          hintText: '입력 후 우측 아이콘을 눌러주세요',
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
