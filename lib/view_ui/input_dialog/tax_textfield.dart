import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaxinputTextfield extends StatelessWidget {

  final void Function(String)? onChanged;

  const TaxinputTextfield({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.w,
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
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
          suffixText: '%',
          suffixStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TwoDigitInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final parts = newValue.text.split('.');
    final intPart = parts[0];
    final decPart = parts.length > 1 ? parts[1] : '';

    if (intPart.length > 2 || (decPart.isNotEmpty && decPart.length > 1)) {
      return oldValue;
    }

    return newValue;
  }
}