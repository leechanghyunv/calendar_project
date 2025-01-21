import 'package:calendar_project_240727/base_consumer.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

import '../../../core/export_package.dart';
import '../auto_copy_icon.dart';
import '../dialog_text.dart';

class GoalInputTextfield extends ConsumerStatefulWidget {
  final bool? autofocus;
  final FocusNode? focusNode;
  final String? hintMsg;
  final String? labelMsg;
  final String? initialValue;
  final double edgeValue;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final TextEditingController? controller;

  const GoalInputTextfield(
      {super.key,
      this.autofocus,
      this.focusNode,
      this.hintMsg,
      this.labelMsg,
      this.initialValue,
      required this.edgeValue,
      this.onChanged,
      required this.textInputAction,
      this.suffixIcon,
      this.suffixIconColor,
      this.controller});

  @override
  ConsumerState<GoalInputTextfield> createState() => _GoalInputTextfieldState();
}

class _GoalInputTextfieldState extends ConsumerState<GoalInputTextfield> {


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: widget.edgeValue),
      child: SizedBox(
        height: 47.sp,
        child: TypeAheadField<Map<String, dynamic>>(
          controller: widget.controller,
          focusNode: widget.focusNode,
          builder: (context,controller,focusNode){
            return  TextFormField(
              controller: controller,
              textInputAction: widget.textInputAction,
              autofocus: widget.autofocus ?? false,
              focusNode: focusNode,
              onChanged: widget.onChanged,
              keyboardType: TextInputType.number,
              initialValue: widget.initialValue,
              inputFormatters: [
                ThousandsFormatter(),
              ],
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                prefixText: '₩ ',
                prefixStyle: ContractFontStyle(),
                suffixIcon: widget.suffixIcon,
                suffixIconColor: widget.suffixIconColor,
                hintText: widget.hintMsg,
                hintStyle: ContractFontStyle().copyWith(color: Colors.grey[600]),
                labelText: widget.labelMsg,
                labelStyle: ContractFontStyle().copyWith(color: Colors.grey[900]),
              ),
            );
          },
          suggestionsCallback: (String search) async {
            final contractValue = ref.contract.value;  // history 값을 임시 변수에 저장
            if (contractValue == null) {
              return [];
            }
            if (contractValue.isEmpty) {
              return [];
            }
            try {
              return contractValue
                  .reversed
                  .map((e) => {
                'goal': e.goal,
                'date': e.date,
              })
                  .where((item) => item['goal'].toString().contains(search))
                  .take(1)
                  .toList();
            } catch (e) {
              return [];
            }
          },
          itemBuilder: (BuildContext context, Map<String, dynamic> item) {
            final date = item['date'] as DateTime;
            final formattedDate = DateFormat('yyyy년 MM월 dd일').format(date);
            final goal = item['goal'].toString().replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                    (Match m) => '${m[1]},'
            );
            return ListTile(
              title: Row(
                children: [
                  Text('${goal}원',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ],
              ),
              subtitle: Text('${formattedDate} 기록',
                style: TextStyle(
                  fontSize: 11
                ),
              ),
            );
          },
          onSelected: (Map<String, dynamic> value){
            setState(() {
              if (widget.controller != null) {
                final formattedPay = value['goal'].toString().replaceAllMapped(
                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'
                );
                widget.controller!.text = formattedPay;
                ref.formzRead.onChangeGoal(value['goal'].toString());
                ref.read(autoCopyProvider.notifier).normalValue(value['goal'].toString());
              }
            });
          },
          emptyBuilder: (context) => const SizedBox(),
        ),







      ),
    );
  }
}
