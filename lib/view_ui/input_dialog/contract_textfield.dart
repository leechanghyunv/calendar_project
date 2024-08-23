import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class MoneyinputTextfield extends StatelessWidget {
  final String? hintMsg;
  final String? labelMsg;
  final String? initialValue;
  final double edgeValue;
  final void Function(String)? onChanged;

  const MoneyinputTextfield(
      {super.key,
        this.hintMsg,
        this.labelMsg,
        this.initialValue,
        required this.edgeValue,
        this.onChanged});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: edgeValue),
      child: Container(
        height: 47.5.w,
        child: TextFormField(
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
            prefixStyle: TextStyle(
              fontSize: 15.sp,
            ),
            // suffixText: '원',
            hintText: hintMsg,
            hintStyle: TextStyle(
              fontSize:  15.sp,
              color: Colors.grey[600],
            ),
            labelText: labelMsg, /// '🌟 1공수(정상근무) *', 🚀 1.5공수(연장근무) * 🎉 2공수(야간근무) *
            labelStyle: TextStyle(
              fontSize:  15.sp,
              color: Colors.grey[900],
            ),
          ),
        ),

      ),
    );
  }
}
