
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../model/work_history_model.dart';

String formatAmountGoal(int amount) {
  if (amount >= 100000000) {
    final won = (amount / 100000000).toStringAsFixed(1); // 억 단위로 변경
    return '$won억원';
  } else if (amount >= 10000) {
    final won = (amount / 10000).toStringAsFixed(0); // 만원 단위로 변경
    return '$won만원';
  } else {
    return '${amount.toStringAsFixed(0)}원';
  }
}

String formatAmount(int amount) {
  final won = (amount / 10000).toStringAsFixed(1); // 소수점 없이 정수 부분만 사용
  return '$won만원';
}

String formatPayInt(int amount) {
  final won = (amount / 10000).toStringAsFixed(0); // 소수점 없이 정수 부분만 사용
  return '$won만원';
}

String formatDecimalAmount(double amount) {
  final won = (amount / 10000).toStringAsFixed(1); // 소수점 없이 정수 부분만 사용
  return '$won만원';
}



String formatDecimalAmountforSmall(double amount) {
  final value = (amount / 10000);
  final int intValue = value.toInt();
  final int length = intValue.toString().length;
  if(length >= 5){
    final billion = (value / 10000).toStringAsFixed(3);
    return '$billion억원';
  } else {
    final int dot = intValue.toString().length <= 3 ? 2 : 1;
    final won = value.toStringAsFixed(dot); // 소수점 없이 정수 부분만 사용
    return '$won만원';
  }
}



String formatPay(double amount) {
  final won = (amount / 10000).toStringAsFixed(0); // 소수점 없이 정수 부분만 사용
  return '$won만원';
}

String formatNumber(int number) {
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}

Map<DateTime, List<WorkHistory>> convertToMap(List<WorkHistory> eventList) {
  Map<DateTime, List<WorkHistory>> mappedData = {};
  for (var data in eventList) {
    if (mappedData.containsKey(data.date)) {
      mappedData[data.date]!.add(data);
    } else {
      mappedData[data.date] = [data];
    }
  }
  return mappedData;
}

String numberWithCommas(String input) {
  if (input.isEmpty) return ''; // 입력이 비어있는 경우 빈 문자열 반환
  // 입력된 문자열을 정수형으로 변환하여 ','를 추가하여 반환
  return int.parse(input).toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), // 정규식을 사용하여 ',' 추가
          (Match match) => '${match[1]},');
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

    if (intPart.length > 2 || (decPart.isNotEmpty && decPart.length > 2)) {
      return oldValue;
    }

    return newValue;
  }
}