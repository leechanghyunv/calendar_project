

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

