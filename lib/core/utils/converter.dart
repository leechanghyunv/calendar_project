
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