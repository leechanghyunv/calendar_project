
import 'dart:io';

import 'package:flutter/material.dart';

class DeletionTextfield extends StatelessWidget {

  final bool? autofocus;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final Color? iconColor;

  const DeletionTextfield({super.key, this.onChanged, this.iconOnPressed, this.iconColor, this.autofocus, this.focusNode});

  @override
  Widget build(BuildContext context) {

    double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;
    final appWidth = MediaQuery.of(context).size.width;

    return TextFormField(
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      cursorColor: Colors.red.shade700,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700),
          ),
          hintText: '입력 후 우측 아이콘을 눌러주세요',
          hintStyle: TextStyle(
            fontSize: adaptiveSize(appWidth < 370 ? 12 : 13),
            letterSpacing: 0.5,
          ),
          suffixStyle: TextStyle(
            fontSize: adaptiveSize(13.5),
          ),
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,letterSpacing: 0.5,height: 1.5,
              fontSize: adaptiveSize(15)),
          suffixIcon: IconButton(
            iconSize: 30,
            splashRadius: 25,
            splashColor: Colors.grey.shade500,
            onPressed: iconOnPressed,
            icon: Icon(Icons.fingerprint_sharp,
              color: iconColor,
            ),
          ),
      ),
      onChanged: onChanged,
    );
  }
}
