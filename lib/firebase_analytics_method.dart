
String formatGoalMoney(dynamic amount) {
  if (amount == null || amount == '0') return '0원';
  final numericAmount = int.parse(amount.toString());

  if (numericAmount >= 100000000) { // 1억 이상
    return "${(numericAmount / 100000000).toStringAsFixed(2)}억원";
  } else if (numericAmount >= 10000000) { // 천만 이상
    return "${(numericAmount / 10000000).toStringAsFixed(2)}천만원";
  }
  return "${(numericAmount / 10000).toStringAsFixed(0)}만원";
}

String formatSpreadsheetMoney(dynamic amount) {
  if (amount == null || amount == '0') return '0만원';

  try {
    final numericAmount = int.parse(amount.toString());
    if (numericAmount < 0) return '0만원';

    // 모든 값을 만 단위로 변환
    return "${(numericAmount / 10000).toStringAsFixed(0)}만원";
  } catch (e) {
    return '0만원';
  }
}



String formatMoney(double value) {
  try {
    return '${value.toStringAsFixed(0)}만원';
  } catch (e) {
    print('Error formatting money: $e');
    return '0.0만원';  // 기본값 반환
  }
}

String formatWorkLoad(dynamic recode) {

  final numericRecode = int.parse(recode.toString());
  return "${numericRecode.toStringAsFixed(1)}공수";
}


String getWeekdayShort(DateTime date) {
  switch (date.weekday) {
    case DateTime.monday: return 'Mon';
    case DateTime.tuesday: return 'Tue';
    case DateTime.wednesday: return 'Wed';
    case DateTime.thursday: return 'Thu';
    case DateTime.friday: return 'Fri';
    case DateTime.saturday: return 'Sat';
    case DateTime.sunday: return 'Sun';
    default: return '';
  }
}

