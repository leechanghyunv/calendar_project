import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';


class DateRangeInputField extends StatefulWidget {
  final String labelText;
  final ValueChanged<List<DateTime>?> onDateRangeChanged;

  const DateRangeInputField({
    Key? key,
    this.labelText = 'YYYY/MM/DD ~ YYYY/MM/DD',
    required this.onDateRangeChanged,
  }) : super(key: key);

  @override
  _DateRangeInputFieldState createState() => _DateRangeInputFieldState();
}

class _DateRangeInputFieldState extends State<DateRangeInputField> {
  // MaskTextInputFormatter 설정: YYYY/MM/DD ~ YYYY/MM/DD 형식
  final MaskTextInputFormatter _dateRangeFormatter = MaskTextInputFormatter(
    mask: '####/##/## ~ ####/##/##', // 날짜 마스크 정의
    filter: {"#": RegExp(r'[0-9]')}, // #에는 숫자만 오도록 필터링
    type: MaskAutoCompletionType.lazy, // 입력이 완료될 때까지 마스크를 채우지 않음
  );

  final TextEditingController _controller = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy/MM/dd');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 입력된 문자열을 시작 날짜와 종료 날짜 DateTime 객체 리스트로 파싱합니다.
  /// 파싱에 실패하면 null을 반환합니다.
  List<DateTime>? _parseDateRange(String dateRangeString) {
    // 입력된 문자열에서 숫자만 추출
    String cleanedString = dateRangeString.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedString.length != 16) {
      // 16자리 (YYYYMMDD + YYYYMMDD)가 아니면 유효하지 않음
      return null;
    }

    try {
      // 첫 번째 날짜 (8자리)
      String startDatePart = cleanedString.substring(0, 8);
      // 두 번째 날짜 (8자리)
      String endDatePart = cleanedString.substring(8, 16);

      // DateTime으로 변환 (YYYYMMDD -> YYYY/MM/DD)
      final startDate = _dateFormat.parseStrict(
        '${startDatePart.substring(0, 4)}/${startDatePart.substring(4, 6)}/${startDatePart.substring(6, 8)}',
      );
      final endDate = _dateFormat.parseStrict(
        '${endDatePart.substring(0, 4)}/${endDatePart.substring(4, 6)}/${endDatePart.substring(6, 8)}',
      );

      // 시작 날짜가 종료 날짜보다 뒤에 오는지 확인 (선택 사항)
      if (startDate.isAfter(endDate)) {
        return null; // 시작 날짜가 종료 날짜보다 늦으면 유효하지 않음
      }

      return [startDate, endDate];
    } catch (e) {
      // 날짜 파싱 오류 발생 시 (예: 유효하지 않은 날짜)
      print('날짜 범위 파싱 오류: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(7.5),
        border: Border.all(
          color: Colors.grey.shade800,
          width: 0.85,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      height: 40,
      child: TextField(

        cursorColor: Colors.grey.shade700,
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: [_dateRangeFormatter],
        decoration: InputDecoration(
          hintText: ' 2025/01/01 ~ 2025/12/31',
          isDense: true,
          hintStyle: TextStyle(
            fontSize: (width > 400 ? 14 : 13.5),
            letterSpacing: 1.25,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
        onChanged: (value) {
          final dateRange = _parseDateRange(value);
          widget.onDateRangeChanged(dateRange);
        },
      ),
    );
  }
}