import 'package:calendar_project_240727/base_consumer.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

import '../../../core/export_package.dart';
import '../auto_copy_icon.dart';
import '../dialog_text.dart';

class PayinputTextfield extends ConsumerStatefulWidget {
  final bool? autofocus;
  final FocusNode? focusNode;
  final String? hintMsg;
  final String? labelMsg;
  final String? initialValue;

  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final TextEditingController? controller;

  const PayinputTextfield(

      {super.key,
        this.autofocus,
        this.hintMsg,
        this.labelMsg,
        this.initialValue,

        this.onChanged,
        this.textInputAction,
        this.focusNode,
        this.controller,
        this.suffixIcon,
        this.suffixIconColor
      });

  @override
  ConsumerState<PayinputTextfield> createState() => _PayinputTextfieldState();
}

class _PayinputTextfieldState extends ConsumerState<PayinputTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height:  47.sp,
        child: TypeAheadField<Map<String, dynamic>>(
          controller: widget.controller,
          focusNode: widget.focusNode,
          builder: (context,controller, focusNode){
            return  TextFormField(
              controller: controller,
              textInputAction: TextInputAction.done,
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
                labelText: widget.labelMsg, /// '🌟 1공수(정상근무) *', 🚀 1.5공수(연장근무) * 🎉 2공수(야간근무) *
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
                'pay': e.normal,
                'date': e.date,
              })
                  .where((item) => item['pay'].toString().contains(search))
                  .take(1)
                  .toList();
            } catch (e) {
              return [];
            }
          },
          itemBuilder: (BuildContext context, Map<String, dynamic> item) {
            final date = item['date'] as DateTime;
            final formattedDate = DateFormat('yyyy년 MM월 dd일').format(date);
            final pay = item['pay'].toString().replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                    (Match m) => '${m[1]},'
            );
            return ListTile(
              title: Row(
                children: [
                  Text('${pay}원',
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
          onSelected: (Map<String, dynamic> value) {
            setState(() {
              if (widget.controller != null) {
                final formattedPay = value['pay'].toString().replaceAllMapped(
                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'
                );
                widget.controller!.text = formattedPay;
                ref.formzRead.onChangePay1(value['pay'].toString());
                ref.read(autoCopyProvider.notifier).normalValue(value['pay'].toString());
              }
            });
          },
          emptyBuilder: (context) => const SizedBox(),
        ),
      ),
    );
  }
}
