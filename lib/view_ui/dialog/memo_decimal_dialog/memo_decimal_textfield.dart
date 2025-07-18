import 'package:calendar_project_240727/base_consumer.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../core/export_package.dart';
import '../../../core/utils/converter.dart';
import '../../../repository/formz/formz_decimal.dart';
import '../../../repository/formz/formz_memo.dart';
import '../../../repository/view_controll/decimal_bool_repo.dart';
import 'drop_down_component.dart';

class MemoTextField extends ConsumerStatefulWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController memoController;
  final FocusNode nodeMemo;

  const MemoTextField(
      {super.key,
        required this.memoController,
        required this.nodeMemo,
        this.onChanged,
        this.onFieldSubmitted});

  @override
  ConsumerState<MemoTextField> createState() => _MemoTextFieldState();
}


class _MemoTextFieldState extends ConsumerState<MemoTextField> {

  @override
  Widget build(BuildContext context) {
      final formzRefread = ref.read(formzMemoValidatorProvider.notifier);

  String hintValue() {
    final data = ref.history.value;

    final selectedDate = DateTime.utc(DateTime.now().year, ref.month, ref.day
    );

    try{
      final existingMemo = data
          ?.where((e) =>
      e.date.year == selectedDate.year &&
          e.date.month == selectedDate.month &&
          e.date.day == selectedDate.day)
          .firstOrNull
          ?.memo;

      return existingMemo?.isNotEmpty ?? false
          ? ' ${existingMemo}'
          : ' ${ref.month}월 ${ref.day}일 메모입력 (필수아님)';
    }catch(e){
      return ' ${ref.month}월 ${ref.day}일 메모입력 (필수아님)';
    }
  }

    return Container(
      height: 70,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.5),
      ),
      child: TypeAheadField<Map<String, dynamic>>(
        controller: widget.memoController,
        focusNode: widget.nodeMemo,
        builder: (context,controller,focusNode){
          return TextFormField(
            maxLines: null, // 자동으로 여러 줄 입력 가능
            controller: controller,
            focusNode: focusNode,
            cursorColor: Colors.grey.shade500,
            decoration: InputDecoration(
              hintText: hintValue(),
              hintStyle: TextStyle(
                  fontSize: 13,overflow: TextOverflow.ellipsis),
              border: InputBorder.none,
              isDense: true,
            ),
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
          );
        },
        suggestionsCallback: (String search) async {
          final data = ref.history.value;
          if (data == null || data.isEmpty) {
            return [];
          }
          try{
            return data.reversed
                .map((e) => {'memo': e.memo,
            }).where((item) =>
            item['memo']!.isNotEmpty && item['memo']!.contains(search)) // 빈 문자열 제외
                .take(3).toList();
          }catch(e){
            return [];
          }

        },
        itemBuilder: (BuildContext context, Map<String, dynamic> item){
          final memo = item['memo'];
          return ListTile(
            title: Text(memo,
              style: TextStyle(fontSize: 13,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
        onSelected: (value){
          String memoText = value['memo'] as String? ?? ''; // memo 값 가져오기
          setState(() {
            widget.memoController.text = memoText;
            formzRefread.onChangeMemo(widget.memoController.text);

          });
        },
        emptyBuilder: (context) => const SizedBox(),
      ),
    );
  }
}



class DecimalTextField extends ConsumerStatefulWidget {
  final TextEditingController decimalController;
  final FocusNode decimalNode;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final Function(String)? onRecordChanged; // 콜백 추가

  final ValueChanged<String>? onFieldSubmitted;

  const DecimalTextField( {
    super.key,
    required this.decimalController,
    required this.decimalNode,
    required this.hintText,
    this.onChanged,
    this.onRecordChanged,
    this.onFieldSubmitted,
  });

  @override
  ConsumerState<DecimalTextField> createState() => _DecimalTextFieldState();
}

class _DecimalTextFieldState extends ConsumerState<DecimalTextField> {


  @override
  Widget build(BuildContext context) {
      final formzRefread = ref.read(formzDecimalValidatorProvider.notifier);

    return Container(
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 5,
            child: TypeAheadField<Map<String, dynamic>>(
              controller: widget.decimalController,
              focusNode: widget.decimalNode,
              builder: (context,controller,focusNode){
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  cursorColor: Colors.grey.shade500,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,3}')),
                    TwoDigitInputFormatter(),
                  ],
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,

                  ),
                  onChanged: widget.onChanged,
                  onFieldSubmitted: widget.onFieldSubmitted,
                );
              },
              suggestionsCallback: (String search){
                final data = ref.history.value;
                if (data == null || data.isEmpty) {
                  return [];
                }
                try{
                  return data.reversed
                      .where((e) => ![0.0, 1.0, 1.5, 2.0].contains(e.record)) // 제외 조건 추가
                      .map((e) => {'record': e.record})
                      .where((item) =>
                  item['record']!.toString().isNotEmpty &&
                      item['record']!.toString().contains(search)) // 빈 문자열 제외 및 검색 필터
                      .take(3).toList();
                }catch(e){
                  return [];
                }
              },
              itemBuilder: (BuildContext context, Map<String, dynamic> item){
                final record = item['record'];
                return ListTile(
                  title: Row(
                    children: [
                      Text('$record',
                        style: TextStyle(fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              },
              onSelected: (value){
                String recordText = value['record'].toString();
                ref.read(decimalBoolRepoProvider.notifier)
                    .changeDecimalBool(false);

                setState(() {
                  widget.decimalController.text = recordText;
                  final decimalValue = double.tryParse(recordText) ?? 0.0; // double 변환
                  formzRefread.onChangeDecimal(decimalValue);
                });
              },
              emptyBuilder: (context) => const SizedBox(),
            ),
          ),
          Flexible(
            flex: 2,
            child: RecordDropDownButton(
                onRecordChanged: (String? val){
                  if (val != null) {
                    widget.onRecordChanged?.call(val);
                  }

                },
            ),
          ),
        ],
      ),

    );
  }
}
