
import 'package:flutter/material.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class DailySubsidyTextfield extends StatelessWidget {

  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final Color? cursorColor;
  final Color borderColor;
  final Color? iconColor;

  const DailySubsidyTextfield({
    super.key,
    this.onChanged,
    this.iconOnPressed,
    this.iconColor,
    this.cursorColor,
    required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor,
      keyboardType: TextInputType.number,
      inputFormatters: [
        ThousandsFormatter(),
      ],
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: borderColor,
          ),
        ),
        hintText: '입력 후 우측 아이콘을 눌러주세요',
        hintStyle: const TextStyle(
          fontSize: 13,letterSpacing: 0.25,
        ),
        // prefixText: '₩ ',
        suffixStyle: const TextStyle(
          fontSize: 13.5,
        ),
        labelStyle: const TextStyle(
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
        ),
      ),
      onChanged: onChanged,
    );
  }
}
