import 'package:flutter/services.dart';

int calculateMonthDifference(DateTime start, DateTime end) {
  return (end.year - start.year) * 12 + (end.month - start.month);
}

String formatAmount(int amount) {
  final value = amount / 10000; // 만원 단위로 변환
  final int intValue = value.toInt();
  final int length = intValue.toString().length;

  if (length >= 5) { // 1억원 이상인 경우 (5자리 이상의 만원 = 억원)
    final billion = (value / 10000).toStringAsFixed(2); // 소수점 2자리
    return '$billion억원';
  } else {
    final won = value.toStringAsFixed(1); // 소수점 1자리
    return '$won만원';
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

    if (intPart.length > 2 || (decPart.isNotEmpty && decPart.length > 3)) {
      return oldValue;
    }

    return newValue;
  }
}

String formatSelectedDate(DateTime date) {
  final year = (date.year % 100).toString().padLeft(2, '0'); // 2025 → 25
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year년 $month월 $day일';
}