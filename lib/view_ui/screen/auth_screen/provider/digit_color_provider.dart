import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'digit_color_provider.g.dart';

@riverpod
class DigitColor extends _$DigitColor {

  @override
  Color build() => Colors.grey.shade100;

  void colorProvider(String? digits) {
    print('digits: ${digits?.length}');
    if (digits != null) {
      final numericDigits = digits.replaceAll(RegExp(r'\D'), '');
      state = numericDigits.length >= 6 ? Colors.black : Colors.grey.shade100;
    }
    else {
      state = Colors.grey.shade100;
    }
  }

  void resetColor() {
    state = Colors.grey.shade100;
  }
}