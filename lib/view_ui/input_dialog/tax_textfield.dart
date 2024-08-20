import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/converter.dart';

class TaxinputTextfield extends StatelessWidget {

  final void Function(String)? onChanged;

  const TaxinputTextfield({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {

    double ratio = MediaQuery.of(context).size.aspectRatio;

    return Container(
      height: ratio > 0.5 ? 43.w : 47.5.w,
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          TwoDigitInputFormatter(), // 최대 길이 설정 (예: "12.34")
        ],
        onChanged: onChanged,
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          hintText: '10.4',
          hintStyle: TextStyle(
            fontSize: ratio > 0.5 ? 13.5.sp : 15.sp,
            color: Colors.grey[600],
          ),
          suffixText: '%',
          suffixStyle: TextStyle(
            fontSize: ratio > 0.5 ? 13.5.sp : 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

