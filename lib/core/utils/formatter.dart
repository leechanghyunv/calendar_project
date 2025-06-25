
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String formatDateInfoBox(DateTime date) {
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '${date.year}년 ${month}월 ${day}일';
}

String formatDateInfoBoxMonth(DateTime date) {
  final month = date.month.toString().padLeft(2, '0');
  return '${month}월';
}


class CommaInputFormatter6Digits extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length > 6) return oldValue;

    final number = int.tryParse(digitsOnly);
    final formatted = NumberFormat('#,###').format(number ?? 0);

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class CommaInputFormatter5Digits extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length > 5) return oldValue;

    final number = int.tryParse(digitsOnly);
    final formatted = NumberFormat('#,###').format(number ?? 0);

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class CommaInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // 숫자 외 문자 제거
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.isEmpty) return newValue.copyWith(text: '');

    final number = int.parse(digitsOnly);
    final formatted = NumberFormat('#,###').format(number);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}


class PercentInputFormatter extends TextInputFormatter {
  final int decimalRange;

  PercentInputFormatter({this.decimalRange = 1});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String raw = newValue.text.replaceAll('%', '');

    // 허용: 1~2자리 정수 또는 소수점 첫째자리까지
    final regex = RegExp(r'^\d{0,2}(\.\d{0,1})?$');

    if (!regex.hasMatch(raw)) {
      return oldValue;
    }

    final newText = raw;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
