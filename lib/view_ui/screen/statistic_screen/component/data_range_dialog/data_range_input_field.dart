import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DateRangeInputField extends StatefulWidget {

  final FocusNode rangeNode;
  final String labelText;
  final ValueChanged<List<DateTime>?> onDateRangeChanged;

  const DateRangeInputField({
    Key? key,
    this.labelText = 'YY/MM/DD ~ YY/MM/DD',
    required this.rangeNode,
    required this.onDateRangeChanged,

  }) : super(key: key);

  @override
  _DateRangeInputFieldState createState() => _DateRangeInputFieldState();
}

class _DateRangeInputFieldState extends State<DateRangeInputField> {
  final TextEditingController _controller = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy/MM/dd');
  String _previousText = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }

  void _handleTextChange() {
    String currentText = _controller.text;
    String formattedText = _formatDateRange(currentText);

    if (formattedText != currentText) {
      _controller.value = TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }

    // 날짜 범위 파싱 및 콜백
    final dateRange = _parseDateRange(formattedText);
    widget.onDateRangeChanged(dateRange);

    _previousText = formattedText;
  }

  String _formatDateRange(String input) {
    // 숫자만 추출
    String digits = input.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return '';

    StringBuffer formatted = StringBuffer();
    int index = 0;

    // 두 개의 날짜를 처리 (각각 6자리: YY/MM/DD)
    for (int dateIndex = 0; dateIndex < 2 && index < digits.length; dateIndex++) {
      if (dateIndex == 1) {
        formatted.write(' ~ ');
      }

      // 년도 (2자리)
      if (index < digits.length) {
        formatted.write(digits[index++]);
        if (index < digits.length) {
          formatted.write(digits[index++]);
        }
      }

      // 월 (2자리) - 스마트 입력
      if (index < digits.length) {
        formatted.write('/');
        int firstMonthDigit = int.parse(digits[index]);

        if (firstMonthDigit > 1) {
          // 2 이상이면 0을 앞에 추가
          formatted.write('0');
          formatted.write(digits[index++]);
        } else if (firstMonthDigit == 1) {
          // 1이면 그대로 입력
          formatted.write(digits[index++]);
          if (index < digits.length) {
            int secondMonthDigit = int.parse(digits[index]);
            if (secondMonthDigit > 2) {
              // 13 이상은 불가능하므로 01로 변경하고 3을 일자로
              formatted.write('2');
              index++; // 다음 숫자는 일자의 첫 번째로
            } else {
              formatted.write(digits[index++]);
            }
          }
        } else {
          // 0이면 다음 숫자 확인
          formatted.write(digits[index++]);
          if (index < digits.length) {
            formatted.write(digits[index++]);
          }
        }
      }

      // 일 (2자리) - 스마트 입력
      if (index < digits.length) {
        formatted.write('/');
        int firstDayDigit = int.parse(digits[index]);

        if (firstDayDigit > 3) {
          // 4 이상이면 0을 앞에 추가
          formatted.write('0');
          formatted.write(digits[index++]);
        } else if (firstDayDigit == 3) {
          // 3이면 다음 숫자 확인 (31까지만 가능)
          formatted.write(digits[index++]);
          if (index < digits.length) {
            int secondDayDigit = int.parse(digits[index]);
            if (secondDayDigit > 1) {
              // 32 이상은 불가능
              formatted.write('1');
            } else {
              formatted.write(digits[index++]);
            }
          }
        } else {
          // 0, 1, 2
          formatted.write(digits[index++]);
          if (index < digits.length) {
            formatted.write(digits[index++]);
          }
        }
      }
    }

    return formatted.toString();
  }

  List<DateTime>? _parseDateRange(String dateRangeString) {
    // ~ 기준으로 분리
    List<String> parts = dateRangeString.split(' ~ ');
    if (parts.length != 2) return null;

    try {
      DateTime? startDate = _parseDate(parts[0]);
      DateTime? endDate = _parseDate(parts[1]);

      if (startDate == null || endDate == null) return null;
      if (startDate.isAfter(endDate)) return null;

      return [startDate, endDate];
    } catch (e) {
      return null;
    }
  }

  DateTime? _parseDate(String dateStr) {
    List<String> parts = dateStr.split('/');
    if (parts.length != 3) return null;

    try {
      int year = int.parse('20${parts[0]}'); // YY -> 20YY
      int month = int.parse(parts[1]);
      int day = int.parse(parts[2]);

      if (month < 1 || month > 12) return null;
      if (day < 1 || day > 31) return null;

      return DateTime(year, month, day);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 25,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(7.5),

      ),
      child: TextField(
        focusNode: widget.rangeNode,
        cursorColor: Colors.grey.shade700,
        controller: _controller,
        keyboardType: TextInputType.number,
        maxLength: 23, // "YY/MM/DD ~ YY/MM/DD" 형식
        decoration: InputDecoration(
          hintText: ' 25.01.01 ~ 25.12.31',
          isDense: true,
          counterText: '', // 글자 수 카운터 숨김
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: 1.25,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
      ),
    );
  }
}