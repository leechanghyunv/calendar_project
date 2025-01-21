import 'package:calendar_project_240727/base_consumer.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../../core/export_package.dart';

final DateTime minDate = DateTime(2010, 1, 1);
final DateTime maxDate = DateTime(2040, 12, 31);

class TimePickerWidget extends ConsumerWidget {
  const TimePickerWidget({super.key});

  static const _pickerStyle = TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );

  Widget _buildPicker(
      String title, DateTime initialDate, Function(DateTime) onChanged,Widget Function(DateTime)? timeWidgetBuilder) {
    return TimePickerSpinnerPopUp(
      locale: const Locale('ko', 'KR'),
      mode: CupertinoDatePickerMode.date,
      initTime: initialDate,
      minTime: minDate,
      maxTime: maxDate,
      barrierColor: Colors.black12,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      cancelText: '취소',
      confirmText: '설정',
      pressType: PressType.singlePress,
      timeFormat: 'yyyy-MM-dd',
      cancelTextStyle: _pickerStyle,
      confirmTextStyle: _pickerStyle,
      onChange: onChanged,
      timeWidgetBuilder: timeWidgetBuilder,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('시작일과 종료일을 선택해주세요',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                    fontSize: appWidth > 400 ? 15 : 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              _buildPicker(
                '시작일 선택',
                ref.startDate,
                    (dateTime) {
                  ref.rangeNot.updateStartDate(dateTime);
                  ref.rangeSelectNot.updateStartSelected(true);
                },
                    (DateTime time){
                  final formattedDate = ref.startSelected  // isDateSelected로 표시할 텍스트 결정
                      ? '${time.year}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}'
                      : '시작일 선택';
                  return _PickerContainer(formattedDate,appWidth);
                },
              ),
              const Spacer(),
              Icon(Icons.redo,size: 25,color: Colors.grey.shade600,),
              const Spacer(),
              _buildPicker(
                  '종료일 선택',
                  ref.endDate,
                      (dateTime){
                    ref.rangeNot.updateEndDate(dateTime);
                    ref.rangeSelectNot.updateEndSelected(true);
                  },
                      (DateTime time){
                    final formattedDate = ref.endSelected
                        ? '${time.year}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}'
                        : '종료일 선택';
                    return _PickerContainer(formattedDate,appWidth);
                  }
              ),
            ],
          ),


        ],
      ),
    );
  }

  Widget _PickerContainer(String date,double width) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
        child: Text(
          date,
          style: TextStyle(
            fontSize: width > 400 ? 15 : 13,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}